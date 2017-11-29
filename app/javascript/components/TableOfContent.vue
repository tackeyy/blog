<template>
  <div>
    <div v-html="html">
    </div>
  </div>
</template>

<script>
export default {
  data () {
    return {
      html: this.createAnchors()
    }
  },
  methods: {
    createAnchors () {
      const node = document.getElementById('table-of-content')
      return node.getAttribute('data-html')
    }
  }
}
</script>

<style lang="sass" scoped>
</style>
