#include <iostream>
#include <fstream>
#include <cpr/cpr.h>

#include "gumbo.h"

std::ofstream writeCsv("links.csv");

std::string extract_html_page()
{
    cpr::Url url = cpr::Url{"https://en.wikipedia.org/wiki/Poppy_seed_defence"};
    cpr::Response response = cpr::Get(url);
    return response.text;
}

void search_for_title(GumboNode* node)
{
    if (node->type != GUMBO_NODE_ELEMENT)
        return;

    if (node->v.element.tag == GUMBO_TAG_H1)
    {
        GumboNode* title_text = static_cast<GumboNode*>(node->v.element.children.data[0]);
        std::cout << title_text->v.text.text << "\n";
        return;
    }

    GumboVector* children = &node->v.element.children;
    for (unsigned int i = 0; i < children->length; i++)
        search_for_title(static_cast<GumboNode*>(children->data[i]));
}

void search_for_links(GumboNode* node)
{
    if (node->type != GUMBO_NODE_ELEMENT)
        return;

    if (node->v.element.tag == GUMBO_TAG_A)
    {
        GumboAttribute* href = gumbo_get_attribute(&node->v.element.attributes, "href");
        if (href)
            std::cout << href->value << "\n";
    }

    GumboVector* children = &node->v.element.children;
    for (unsigned int i = 0; i < children->length; i++)
    {
        search_for_links(static_cast<GumboNode*>(children->data[i]));
    }
}

int main() {
    std::string page_content = extract_html_page();

    GumboOutput* parsed_response = gumbo_parse(page_content.c_str());

    search_for_title(parsed_response->root);

    // free the allocated memory

    gumbo_destroy_output(&kGumboDefaultOptions, parsed_response);

    std::cout << "testing" << std::endl;
}
