MatestackUiCore.Vue.component('custom-person-activity', {
  mixins: [MatestackUiCore.componentMixin],
  data() {
    return {
      url: 'https://www.boredapi.com/api/activity/?participants=2',
      activities: []
    };
  },
  methods: {
    addActivity: function(){
      fetch(this.url, {
        headers: [
          ["Content-Type", "application/json"],
          ["Content-Type", "text/plain"]
        ]
      })
      .then(response => response.json())
      .then(data => this.activities.push(data.activity));
    },
    deleteActivity: function(position){
      this.activities.splice(position, 1);
    }
  }
});
