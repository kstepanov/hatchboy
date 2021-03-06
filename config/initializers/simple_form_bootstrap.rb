# Use this setup block to configure all options available in SimpleForm.
SimpleForm.setup do |config|
  config.wrappers :bootstrap, tag: 'div', class: 'form-group', error_class: "error-control" do |b|
    b.use :html5
    b.use :placeholder
    b.use :label
    b.use :hint,  wrap_with: { tag: 'span', class: 'help' }
    b.wrapper :input_wrapper, tag: 'div', class: 'input-with-icon right' do |ba|
      ba.wrapper(tag: 'i', :class => "") {}
      ba.use :input
      ba.use :error, wrap_with: { tag: 'span', class: 'error' }
    end
  end
  
  config.wrappers :inline_checkbox, tag: 'div', class: 'form-group', error_class: "error-control" do |b|
    b.use :html5
    b.use :placeholder
    b.use :hint,  wrap_with: { tag: 'span', class: 'help' }
    b.wrapper :checkbox_wrapper, tag: 'div', class: 'checkbox' do |ba|
      ba.wrapper(tag: 'i', :class => "") {}
      ba.use :input, wrap_with: false
      ba.use :label
      ba.use :error, wrap_with: { tag: 'span', class: 'error' }
    end
  end
  
  config.label_class = 'form-label'
  config.input_class = 'form-control'

  config.wrappers :prepend, tag: 'div', class: "control-group", error_class: 'error' do |b|
    b.use :html5
    b.use :placeholder
    b.use :label
    b.wrapper tag: 'div', class: 'controls' do |input|
      input.wrapper tag: 'div', class: 'input-prepend' do |prepend|
        prepend.use :input
      end
      input.use :hint,  wrap_with: { tag: 'span', class: 'help-block' }
      input.use :error, wrap_with: { tag: 'span', class: 'help-inline' }
    end
  end

  config.wrappers :append, tag: 'div', class: "control-group", error_class: 'error' do |b|
    b.use :html5
    b.use :placeholder
    b.use :label
    b.wrapper tag: 'div', class: 'controls' do |input|
      input.wrapper tag: 'div', class: 'input-append' do |append|
        append.use :input
      end
      input.use :hint,  wrap_with: { tag: 'span', class: 'help-block' }
      input.use :error, wrap_with: { tag: 'span', class: 'help-inline' }
    end
  end

  # Wrappers for forms and inputs using the Twitter Bootstrap toolkit.
  # Check the Bootstrap docs (http://twitter.github.com/bootstrap)
  # to learn about the different styles for forms and inputs,
  # buttons and other elements.
  config.default_wrapper = :bootstrap
end
