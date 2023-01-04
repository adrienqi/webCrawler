#include <iostream>
#include <fstream>
#include <sstream>
#include <unordered_map>

#include <cpr/cpr.h>

#include "gumbo.h"

std::string extract_html_page(std::string link, bool robot) {
    if (robot) {
        if (link[link.size()] == '/') {
            link += "robots.txt";
        } else {
            link += "/robots.txt";
        }
    }
    cpr::Url url = cpr::Url{link};
    cpr::Response response = cpr::Get(url);
    return response.text;
}

void search_for_links(GumboNode* node, std::ofstream& writeCsv, std::unordered_map<std::string, std::string> disallowMap) {
    if (node->type != GUMBO_NODE_ELEMENT) {
        return;
    }

    GumboAttribute* href;
    if (node->v.element.tag == GUMBO_TAG_A &&
        (href = gumbo_get_attribute(&node->v.element.attributes, "href"))) {
        if (disallowMap.find(href->value) == disallowMap.end()) {
            
        }
        writeCsv << href->value << std::endl;
    }

    GumboVector* children = &node->v.element.children;
    for (unsigned int i = 0; i < children->length; ++i) {
        search_for_links(static_cast<GumboNode*>(children->data[i]), writeCsv, disallowMap);
    }
}

std::unordered_map<std::string, std::string> parse_robots_txt(std::string& robots_txt) {
    std::ofstream disallow("/Users/aqi/Documents/GitHub/webCrawler/build/csvFiles/disallow.csv");
    std::ofstream allow("/Users/aqi/Documents/GitHub/webCrawler/build/csvFiles/allow.csv");
    std::ofstream noindex("/Users/aqi/Documents/GitHub/webCrawler/build/csvFiles/index.csv");

    std::unordered_map<std::string, std::string> disallowMap;

    std::istringstream iss(robots_txt);

    std::string line;
    bool user_agent = false;

    while (iss >> line) {
        if (line == "User-Agent:" || line == "User-agent:") {
            iss >> line;
            if (line == "*") {
                user_agent = true;
            } else {
                user_agent = false;
            }
        }
    
        if (!user_agent) {
            continue;
        }

        if (line == "Disallow:") {
            iss >> line;
            disallow << line << std::endl;
            disallowMap[line] = line;
        } else if (line == "Allow:") {
            iss >> line;
            allow << line << std::endl;
        } else if (line == "noindex") {
            iss >> line;
            noindex << line << std::endl;
        }
    }

    return disallowMap;
}

int main(int argc, char** argv) {
    std::ofstream writeCsv("/Users/aqi/Documents/GitHub/webCrawler/build/csvFiles/links.csv"); // makes new file each run

    std::string link;

    std::cout << "Enter link" << std::endl;
    std::cin >> link;

    std::string robots_txt = extract_html_page(link, true);
    
    std::unordered_map<std::string, std::string> disallowMap = parse_robots_txt(robots_txt);

    std::string page_content = extract_html_page(link, false);
    GumboOutput* parsed_response = gumbo_parse(page_content.c_str());

    search_for_links(parsed_response->root, writeCsv, disallowMap);
    // free the allocated memory
    gumbo_destroy_output(&kGumboDefaultOptions, parsed_response);
}
