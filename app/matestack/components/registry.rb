module Components::Registry
  Matestack::Ui::Core::Component::Registry.register_components(
    jumbotron_header: Components::Shared::JumbotronHeader,
    person_teaser: Components::Persons::Teaser,
    person_teaser: Components::Persons::Teaser,
    person_disclaimer: Components::Persons::Disclaimer,
    person_activity: Components::Persons::Activity,
  )
end