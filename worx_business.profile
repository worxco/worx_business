<?php
// $Id$

/**
 * Return an array of the modules to be enabled when this profile is installed.
 *
 * @return
 *   An array of modules to enable.
 */
function worx_business_profile_modules() {
  return array(
    // General modules
    'help', 'menu', 'taxonomy', 'dblog', 'path', 'admin', 'advanced_help', 'views', 'views_bulk_operations', 'token', 'pathauto', 'lightbox2', 
    // CCK
    'content', 'fieldgroup', 'filefield', 'link', 'nodereference', 'number', 'optionwidgets', 'text', 'userreference',
    // Image tools
    'imagefield', 'imageapi', 'imageapi_gd', 'imageapi_imagemagick', 'imagecache',
    // Chaos Tools
    'ctools', 'page_manager', 'panels', 'context_admin', 'context_admin_vbo', 'views_content',
    // Features tools
    'context', 'strongarm', 'features', 
    // Standard modules
    'devel', 'drupalforfirebug', 'drupalforfirebug_preprocess', 'htmlpurifier', 'image_resize_filter', 'jquery_update', 'menu_attributes', 'menu_block', 'menu_breadcrumb', 'xmlsitemap', 
    // Wysiwyg
    'wysiwyg', 'imce', 'imce_wysiwyg', 
    // Php format needed so that Footer Mesage block and have php code for the year, site name, and login/logout.
    'php', 
    );
		
}

/**
 * Return a description of the profile for the initial installation screen.
 *
 * @return
 *   An array with keys 'name' and 'description' describing this profile,
 *   and optional 'language' to override the language selection for
 *   language-specific profiles.
 */
function worx_business_profile_details() {
  return array(
    'name' => 'Worx Business',
    'description' => 'Installs the Worx Business profile.  Specific features will require turning on.'
  );
}

/**
 * Return a list of tasks that this profile supports.
 *
 * @return
 *   A keyed array of tasks the profile will perform during
 *   the final stage. The keys of the array will be used internally,
 *   while the values will be displayed to the user in the installer
 *   task list.
 */
function worx_business_profile_task_list() {
}

/**
 * Perform any final installation tasks for this profile.
 *
 * The installer goes through the profile-select -> locale-select
 * -> requirements -> database -> profile-install-batch
 * -> locale-initial-batch -> configure -> locale-remaining-batch
 * -> finished -> done tasks, in this order, if you don't implement
 * this function in your profile.
 *
 * If this function is implemented, you can have any number of
 * custom tasks to perform after 'configure', implementing a state
 * machine here to walk the user through those tasks. First time,
 * this function gets called with $task set to 'profile', and you
 * can advance to further tasks by setting $task to your tasks'
 * identifiers, used as array keys in the hook_profile_task_list()
 * above. You must avoid the reserved tasks listed in
 * install_reserved_tasks(). If you implement your custom tasks,
 * this function will get called in every HTTP request (for form
 * processing, printing your information screens and so on) until
 * you advance to the 'profile-finished' task, with which you
 * hand control back to the installer. Each custom page you
 * return needs to provide a way to continue, such as a form
 * submission or a link. You should also set custom page titles.
 *
 * You should define the list of custom tasks you implement by
 * returning an array of them in hook_profile_task_list(), as these
 * show up in the list of tasks on the installer user interface.
 *
 * Remember that the user will be able to reload the pages multiple
 * times, so you might want to use variable_set() and variable_get()
 * to remember your data and control further processing, if $task
 * is insufficient. Should a profile want to display a form here,
 * it can; the form should set '#redirect' to FALSE, and rely on
 * an action in the submit handler, such as variable_set(), to
 * detect submission and proceed to further tasks. See the configuration
 * form handling code in install_tasks() for an example.
 *
 * Important: Any temporary variables should be removed using
 * variable_del() before advancing to the 'profile-finished' phase.
 *
 * @param $task
 *   The current $task of the install system. When hook_profile_tasks()
 *   is first called, this is 'profile'.
 * @param $url
 *   Complete URL to be used for a link or form action on a custom page,
 *   if providing any, to allow the user to proceed with the installation.
 *
 * @return
 *   An optional HTML string to display to the user. Only used if you
 *   modify the $task, otherwise discarded.
 */
function worx_business_profile_tasks(&$task, $url) {

  // Insert default user-defined node types into the database. For a complete
  // list of available node type attributes, refer to the node type API
  // documentation at: http://api.drupal.org/api/HEAD/function/hook_node_info.
  $types = array(
    array(
      'type' => 'page',
      'name' => st('Page'),
      'module' => 'node',
      'description' => st("A <em>page</em>, similar in form to a <em>story</em>, is a simple method for creating and displaying information that rarely changes, such as an \"About us\" section of a website. By default, a <em>page</em> entry does not allow visitor comments and is not featured on the site's initial home page."),
      'custom' => TRUE,
      'modified' => TRUE,
      'locked' => FALSE,
      'help' => '',
      'min_word_count' => '',
    ),
  );

  foreach ($types as $type) {
    $type = (object) _node_type_set_defaults($type);
    node_type_save($type);
  }

  // Default page to not be promoted and have comments disabled.
  variable_set('node_options_page', array('status'));
  variable_set('comment_page', COMMENT_NODE_DISABLED);

  // Don't display date and author information for page nodes by default.
  $theme_settings = variable_get('theme_settings', array());
  $theme_settings['toggle_node_info_page'] = FALSE;
  variable_set('theme_settings', $theme_settings);
	
  // Configure user settings. Set user creation to administrator only.
  variable_set('user_register', '0');
	
	// Configure Automated URL alias.
  variable_set('pathauto_node_pattern', '[menupath-raw]');
  variable_set('pathauto_taxonomy_pattern', '[vocab-raw]/[catpath-raw]');
	
	//Setup Home link in the Primary menu
	if (!db_result(db_query("select count(*) as num from {menu_links} where link_path = '<front>' and link_title = 'Home'"))) {
    $link = array('menu_name' => 'primary-links', 'link_path' => '<front>', 'link_title' => 'Home', 'weight' => -50);
    menu_link_save($link);
	}

  // Configure visible blocks.
  // Disable all default blocks for current theme.
  db_query("UPDATE {blocks} SET status = %d, region = '%s' " .
    "WHERE theme = '%s' AND module = '%s' OR module = '%s'",
    0, NULL, 'garland', 'user', 'system');
  
	if (!db_result(db_query("select count(*) as num from {blocks} where module = 'block' and delta = 1"))) {
    db_query("INSERT INTO {blocks} (module, delta, theme, status, weight, " .
      "region, custom, throttle, visibility, pages, title, cache) " .
      "VALUES ('%s', '%s', '%s', %d, %d, '%s', %d, %d, %d, '%s', '%s', %d)",
      'block', '1', 'garland', 1, -11, 'footer', 0, 0, 0, NULL, NULL, -1);
    db_query("INSERT INTO {boxes} VALUES (%d, '%s', '%s', %d)",
      1, '<p>&copy;<?php print date(Y); ?> <strong><?php print variable_get(\'site_name\', \'Drupal\'); ?></strong>. - All Rights Reserved</p><p><?php global $user; if ($user->uid == 0) { ?><a href="/user">Site Admin Login</a><?php } else { ?><a href="/logout">Logout</a><?php } ?> | Developed by <a href="http://www.worxco.com/" target="_blank">the Worx Company</a> | Hosted by <a href="http://www.hostsofamerica.com/" target="_blank">Hosts of America</a></p>', 'Footer Message', 3);
	}
	
	//Remove and add the standard input formats for Filtered HTML
	db_query("DELETE FROM {filters} WHERE format = 1 AND module = 'filter'");
	
	if (!db_result(db_query("select count(*) as num from {filters} where format = 1 and module='image_resize_filter' and delta = 0"))) {
    db_query("INSERT INTO {filters} (format, module, delta, weight) " .
      "VALUES ('%d', '%s', '%d', %d)",
      1, 'image_resize_filter', 0, -10);
  }
	if (!db_result(db_query("select count(*) as num from {filters} where format = 1 and module='htmlpurifier' and delta = 0"))) {
    db_query("INSERT INTO {filters} (format, module, delta, weight) " .
      "VALUES ('%d', '%s', '%d', %d)",
      1, 'htmlpurifier', 1, -9);
  }
	
  //Wysiwyg setup to use ckeditor 
  $settings = array (
    'default' => 1,
    'user_choose' => 0,
    'show_toggle' => 1,
    'theme' => 'advanced',
    'language' => 'en',
    'buttons' => array (
      'default' => array (
        'Bold' => 1,
        'Italic' => 1,
        'Underline' => 1,
        'Strike' => 1,
        'JustifyLeft' => 1,
        'JustifyCenter' => 1,
        'JustifyRight' => 1,
        'JustifyBlock' => 1,
        'BulletedList' => 1,
        'NumberedList' => 1,
        'Outdent' => 1,
        'Indent' => 1,
        'Undo' => 1,
        'Redo' => 1,
        'Link' => 1,
        'Unlink' => 1,
        'Anchor' => 1,
        'Image' => 1,
        'TextColor' => 1,
        'BGColor' => 1,
        'Superscript' => 1,
        'Subscript' => 1,
        'Blockquote' => 1,
        'HorizontalRule' => 1,
        'Cut' => 1,
        'Copy' => 1,
        'Paste' => 1,
        'PasteText' => 1,
        'RemoveFormat' => 1,
        'SpecialChar' => 1,
        'Format' => 1,
        'Font' => 1,
        'FontSize' => 1,
        'Styles' => 1,
        'Table' => 1,
        'SelectAll' => 1,
        'Find' => 1,
        'Replace' => 1,
        'SpellChecker' => 1,
        'Scayt' => 1,
        'About' => 1,
      ),
      'imce' => array (
        'imce' => 1,
      ),
      'drupal' => array (
        'break' => 1,
      ),
    ),
    'toolbar_loc' => 'top',
    'toolbar_align' => 'left',
    'path_loc' => 'bottom',
    'resizing' => 1,
    'verify_html' => 1,
    'preformatted' => 0,
    'convert_fonts_to_spans' => 1,
    'remove_linebreaks' => 0,
    'apply_source_formatting' => 0,
    'paste_auto_cleanup_on_paste' => 0,
    'block_formats' => 'p,address,pre,h2,h3,h4,h5,h6,div',
    'css_setting' => 'none',
    'css_path' => '',
    'css_classes' => '',
  );
  
  $settings = serialize($settings);
	if (db_result(db_query("select count(*) as num from {wysiwyg} where format=1"))) {
    db_query("update {wysiwyg} set editor='ckeditor', settings='%s where format=1", $settings);
  }
  else {
    db_query("insert into {wysiwyg} (format, editor, settings) values(1, 'ckeditor', '%s')", $settings);
  }
	if (db_result(db_query("select count(*) as num from {wysiwyg} where format=2"))) {
    db_query("update {wysiwyg} set editor='ckeditor', settings='%s where format=2", $settings);
  }
  else {
    db_query("insert into {wysiwyg} (format, editor, settings) values(2, 'ckeditor', '%s')", $settings);
  }
	
	// Update the menu router information.
  menu_rebuild();
}

/**
 * Implementation of hook_form_alter().
 *
 * Allows the profile to alter the site-configuration form. This is
 * called through custom invocation, so $form_state is not populated.
 */
function worx_business_form_alter(&$form, $form_state, $form_id) {
  if ($form_id == 'install_configure') {
    // Set default for site name field.
    $form['site_information']['site_name']['#default_value'] = $_SERVER['SERVER_NAME'];
  }
}
