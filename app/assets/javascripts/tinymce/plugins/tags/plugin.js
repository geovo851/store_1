tinymce.PluginManager.add('tags', function(editor, url) {
  var defaultTags = [
    [
      {text: 'City', value: '%{city}'},
      {text: 'Club', value: '%{club}'},
      {text: 'Commented by', value: '%{commented_by}'}
    ],
    [
      {text: 'Company', value: '%{company}'},
      {text: 'Confirmation link', value: '%{confirmation_link}'},
      {text: 'Coordinator', value: '%{coordinator}'}
    ],
    [
      {text: 'Email', value: '%{email}'},
      {text: 'Full name', value: '%{full_name}'},
      {text: 'Link to club application', value: '%{link_to_club_application}'}
    ],
    [
      {text: 'Link to forum club', value: '%{link_to_forum_club}'},
      {text: 'Link to forum topic club', value: '%{link_to_forum_topic_club}'},
      {text: 'New comment', value: '%{new_comment}'}
    ],
    [
      {text: 'Order', value: '%{order}'},
      {text: 'Participant company', value: '%{participant_company}'},
      {text: 'Participant name', value: '%{participant_name}'}
    ],
    [
      {text: 'Password', value: '%{password}'},
      {text: 'Reason', value: '%{reason}'},
      {text: 'Reset password link', value: '%{reset_password_link}'}
    ],
    [
      {text: 'Root link', value: '%{root_link}'},
      {text: 'Source', value: '%{source}'},
      {text: 'Unlock link', value: '%{unlock_link}'}
    ],
    [
      {text: 'Your post', value: '%{your_post}'},
      {text: 'Article path', value: '%{article_link}'},
      {text: 'Unsubscribe link', value: '%{unsubscribe_article_comments_link}'},
    ]
  ];

  function getHtml() {
    var tagsHtml;

    tagsHtml = '<table role="presentation" class="mce-grid">';

    tinymce.each(defaultTags, function (row) {
      tagsHtml += '<tr>';

      tinymce.each(row, function (tag) {
        console.log(tag.text)
        tagsHtml += '<td><a href="#" data-mce-value="' + tag.value + '">' + tag.text + '</a></td>';
      });

      tagsHtml += '</tr>';
    });

    tagsHtml += '</table>';

    return tagsHtml;
  }

  editor.addMenuItem('Tags', {
    text: 'Tags',
    context: 'insert',
    onclick: function() {
      editor.windowManager.open({
        title: 'Tags',
        width: 450,
        height: 300,
        body: [{
          type: 'container',
          html: getHtml(),
          onclick: function (e) {
            var linkElm = editor.dom.getParent(e.target, 'a');

            if (linkElm) {
              editor.insertContent(linkElm.getAttribute('data-mce-value'));
              editor.windowManager.close(this);
            }
          }
        }],
        buttons: [{
          text: 'Close',
          onclick: 'close'
        }]
      });
    }
  });
});