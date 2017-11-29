import Vue from 'vue/dist/vue.esm'
import TableOfContent from "../components/TableOfContent.vue"

document.addEventListener("DOMContentLoaded", () => {
  new Vue({
    el: "TableOfContent",
    template: "<TableOfContent/>",
    components: {
      TableOfContent
    }
  })
})
