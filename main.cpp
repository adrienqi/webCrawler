#include <iostream>
#include <fstream>
#include <cpr/cpr.h>

#include "gumbo.h"

std::string extract_html_page(std::string link)
{
    cpr::Url url = cpr::Url{link};
    cpr::Response response = cpr::Get(url);
    return response.text;
}

void search_for_links(GumboNode* node, std::ofstream& writeCsv) {
    if (node->type != GUMBO_NODE_ELEMENT) {
        return;
    }

    GumboAttribute* href;
    if (node->v.element.tag == GUMBO_TAG_A &&
        (href = gumbo_get_attribute(&node->v.element.attributes, "href"))) {
        writeCsv << href->value << std::endl;
    }

    GumboVector* children = &node->v.element.children;
    for (unsigned int i = 0; i < children->length; ++i) {
        search_for_links(static_cast<GumboNode*>(children->data[i]), writeCsv);
    }
}

int main(int argc, char** argv) {

    std::ofstream writeCsv("links.csv");
    std::string link;

    std::cout << "Enter link" << std::endl;
    std::cin >> link;

    std::string page_content = extract_html_page(link);

    GumboOutput* parsed_response = gumbo_parse(page_content.c_str());
    search_for_links(parsed_response->root, writeCsv);
    // free the allocated memory
    gumbo_destroy_output(&kGumboDefaultOptions, parsed_response);
}
