import Vue from 'vue/dist/vue.esm.js'
import VueRouter from 'vue-router'
import Index from '../components/index.vue'
import Starbucks from '../components/starbucks.vue'
import Pronto from '../components/pronto.vue'
import Doutor from '../components/doutor.vue'

Vue.use(VueRouter)

export default new VueRouter({
  mode: 'history',
  routes: [
    { path: '/', component: Index },
    { path: '/starbucks', component: Starbucks },
    { path: '/pronto', component: Pronto },
    { path: '/doutor', component: Doutor },
  ],
})