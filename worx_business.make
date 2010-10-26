core = "6.x"

; Contrib projects

projects[admin][subdir] = "contrib"
projects[admin][version] = "2"

projects[advanced_help][subdir] = "contrib"
projects[advanced_help][version] = "1"

projects[views][subdir] = "contrib"
projects[views][version] = "2"

projects[views_bulk_operations][subdir] = "contrib"
projects[views_bulk_operations][version] = "1"

projects[token][subdir] = "contrib"
projects[token][version] = "1"

projects[pathauto][subdir] = "contrib"
projects[pathauto][version] = "1"

projects[lightbox2][subdir] = "contrib"
projects[lightbox2][version] = "1"

projects[cck][subdir] = "contrib"
projects[cck][version] = "2"

projects[filefield][subdir] = "contrib"
projects[filefield][version] = "3"

projects[link][subdir] = "contrib"
projects[link][version] = "2"

projects[imagefield][subdir] = "contrib"
projects[imagefield][version] = "3"

projects[imageapi][subdir] = "contrib"
projects[imageapi][version] = "1"

projects[imagecache][subdir] = "contrib"
projects[imagecache][version] = "2"

projects[ctools][subdir] = "contrib"
projects[ctools][version] = "1"

projects[panels][subdir] = "contrib"
projects[panels][version] = "3"

projects[context_admin][subdir] = "contrib"
projects[context_admin][version] = "1"

projects[context][subdir] = "contrib"
projects[context][version] = "3"

projects[strongarm][subdir] = "contrib"
projects[strongarm][version] = "2"

projects[features][subdir] = "contrib"
projects[features][version] = "1"

projects[devel][subdir] = "standard"
projects[devel][version] = "1"

projects[drupalforfirebug][subdir] = "standard"
projects[drupalforfirebug][version] = "1"

projects[globalredirect][subdir] = "standard"
projects[globalredirect][version] = "1"

projects[htmlpurifier][subdir] = "standard"
projects[htmlpurifier][version] = "2"

projects[image_resize_filter][subdir] = "standard"
projects[image_resize_filter][version] = "1"

projects[jquery_update][subdir] = "standard"
projects[jquery_update][version] = "1"

projects[menu_attributes][subdir] = "standard"
projects[menu_attributes][version] = "1"

projects[menu_block][subdir] = "standard"
projects[menu_block][version] = "2"

projects[menu_breadcrumb][subdir] = "standard"
projects[menu_breadcrumb][version] = "1"

projects[path_redirect][subdir] = "standard"
projects[path_redirect][version] = "1"

projects[skinr][subdir] = "standard"
projects[skinr][version] = "1"

projects[xmlsitemap][subdir] = "standard"
projects[xmlsitemap][version] = "1"

projects[wysiwyg][subdir] = "standard"
projects[wysiwyg][version] = "2"

projects[imce][subdir] = "standard"
projects[imce][version] = "1"

projects[imce_wysiwyg][subdir] = "standard"
projects[imce_wysiwyg][version] = "1"

projects[content_access][subdir] = "standard"
projects[content_access][version] = "1"

projects[css_injector][subdir] = "standard"
projects[css_injector][version] = "1"

projects[email][subdir] = "secondary"
projects[email][version] = "1"

projects[embed_gmap][subdir] = "secondary"
projects[embed_gmap][version] = "1"

projects[phone][subdir] = "secondary"
projects[phone][version] = "2"

projects[zipcode][subdir] = "secondary"
projects[zipcode][version] = "2"

projects[auto_nodetitle][subdir] = "secondary"
projects[auto_nodetitle][version] = "1"

projects[custom_breadcrumbs][subdir] = "secondary"
projects[custom_breadcrumbs][version] = "1"

projects[date][subdir] = "secondary"
projects[date][version] = "2"

projects[google_analytics][subdir] = "secondary"
projects[google_analytics][version] = "3"

projects[gtranslate][subdir] = "secondary"
projects[gtranslate][version] = "1"

projects[nodequeue][subdir] = "secondary"
projects[nodequeue][version] = "2"

projects[nodetitle][subdir] = "secondary"
projects[nodetitle][version] = "1"

projects[scheduler][subdir] = "secondary"
projects[scheduler][version] = "1"

projects[search404][subdir] = "secondary"
projects[search404][version] = "1"

projects[seo_checklist][subdir] = "secondary"
projects[seo_checklist][version] = "3"

projects[site_map][subdir] = "secondary"
projects[site_map][version] = "1"

projects[site_verify][subdir] = "secondary"
projects[site_verify][version] = "1"

projects[webform][subdir] = "secondary"
projects[webform][version] = "3"

;Libraries
libraries[htmlpurifier_library][download][type] = "git"
libraries[htmlpurifier_library][destination] = "modules/standard/htmlpurifier"
libraries[htmlpurifier_library][download][url] = "git://github.com/FatGuyLaughing/htmlpurifier_library.git"
libraries[htmlpurifier_library][directory_name] = "library"

libraries[ckeditor][download][type] = "get"
libraries[ckeditor][destination] = "libraries"
libraries[ckeditor][download][url] = "http://download.cksource.com/CKEditor/CKEditor/CKEditor%203.4.1/ckeditor_3.4.1.zip"
libraries[ckeditor][directory_name] = "ckeditor"

;Features
projects[menu_sub_pages][download][type] = "get"
projects[menu_sub_pages][destination] = "features"
projects[menu_sub_pages][download][url] = "http://features.worxco.com/sites/default/files/fserver/menu_sub_pages-6.x-1.0-alpha1.tgz"
projects[menu_sub_pages][directory_name] = "menu_sub_pages"

projects[worx_blog][download][type] = "get"
projects[worx_blog][destination] = "features"
projects[worx_blog][download][url] = "http://features.worxco.com/sites/default/files/fserver/worx_blog-6.x-1.0-alpha4.tgz"
projects[worx_blog][directory_name] = "worx_blog"

projects[worx_catalog][download][type] = "get"
projects[worx_catalog][destination] = "features"
projects[worx_catalog][download][url] = "http://features.worxco.com/sites/default/files/fserver/worx_catalog-6.x-1.0-alpha3.tgz"
projects[worx_catalog][directory_name] = "worx_catalog"

projects[worx_faq][download][type] = "get"
projects[worx_faq][destination] = "features"
projects[worx_faq][download][url] = "http://features.worxco.com/sites/default/files/fserver/worx_faq-6.x-1.0-alpha5.tgz"
projects[worx_faq][directory_name] = "worx_faq"

projects[worx_news][download][type] = "get"
projects[worx_news][destination] = "features"
projects[worx_news][download][url] = "http://features.worxco.com/sites/default/files/fserver/worx_news-6.x-1.0-alpha5.tgz"
projects[worx_news][directory_name] = "worx_news"

projects[worx_services][download][type] = "get"
projects[worx_services][destination] = "features"
projects[worx_services][download][url] = "http://features.worxco.com/sites/default/files/fserver/worx_services-6.x-1.0-alpha2.tgz"
projects[worx_services][directory_name] = "worx_services"

projects[worx_tesimonials][download][type] = "get"
projects[worx_tesimonials][destination] = "features"
projects[worx_tesimonials][download][url] = "http://features.worxco.com/sites/default/files/fserver/worx_testimonials-6.x-1.0-alpha4.tgz"
projects[worx_tesimonials][directory_name] = "worx_tesimonials"

libraries[filterted_html][download][type] = "git"
libraries[filterted_html][destination] = "features"
libraries[filterted_html][download][url] = "git://github.com/Staris/Filtered-HTML.git"
libraries[filterted_html][directory_name] = "filterted_html"

libraries[menu_block][download][type] = "git"
libraries[menu_block][destination] = "features"
libraries[menu_block][download][url] = "git://github.com/Staris/Menu-Block-Setup.git"
libraries[menu_block][directory_name] = "menu_block"
