module Components::Registry
  Matestack::Ui::Core::Component::Registry.register_components(
    person_teaser: Components::Persons::Teaser,
    person_disclaimer: Components::Persons::Disclaimer,
  )
end