module Admin::Components::Registry
  Matestack::Ui::Core::Component::Registry.register_components(
    notifications: Admin::Components::Shared::Notifications,
  )
end