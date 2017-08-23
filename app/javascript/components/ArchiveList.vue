<template>
  <section>
    <header>
      <h3>{{ label }}</h3>
    </header>
    <hr>
    <ul v-for="year in this.years" class="archive-list-ul">
      <li @click="toggle(year)" :model="year" :class="[year.open ? 'archive-open' : 'archive-close']">
        <span v-if="year.total == 0">{{ year.name }}({{ year.total }})</span>
        <a v-else :href="year.path">{{ year.name }}({{ year.total }})</a>
      </li>
      <ul v-if="year.open" v-for="month in year.months" class="archive-list-ul">
        <li class="archive-list-li">
          <a :href="month.path">{{ month.name }}({{ month.total }})</a>
        </li>
      </ul>
    </ul>
  </section>
</template>

<script>
export default {
  data () {
    return {
      label: 'アーカイブ',
      years: this.getArchives()
    }
  },
  methods: {
    toggle (year) {
      this.years.forEach(function(_year, i){
        if (_year.name === year.name) {
          _year.open = !_year.open
        }
      })
    },
    getArchives () {
      const node = document.getElementById('archive-list')
      return JSON.parse(node.getAttribute('data-archives'))
    }
  },
}
</script>

<style lang="sass" scoped>
.archive-list-ul
  list-style-type: none
  line-height: 1.5em

.archive-close::before
  margin-right: 2%
  font-family: 'FontAwesome'
  content: '\f0da' // fa-caret-right

.archive-open::before
  margin-right: 2%
  font-family: 'FontAwesome'
  content: '\f0d7' // fa-caret-down

.archive-list-li
  list-style-type: circle
</style>
