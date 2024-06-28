# config/initializers/active_storage_extension.rb

ActiveSupport.on_load(:active_storage_attachment) do
  prepend ActiveStorageAttachmentExtension
end
