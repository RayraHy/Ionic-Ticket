import { createRouter, createWebHistory } from '@ionic/vue-router';
import { RouteRecordRaw } from 'vue-router';
import TabsPageT from '../views/Atendente/TabsPage.vue';
import TabsPageC from '../views/Cliente/TabsPage.vue'

const routes: Array<RouteRecordRaw> = [
  {
    path: '/',
    redirect: '/login'
  },
  {
    path: '/login',
    component: () => import('@/views/LoginPage.vue')
  },
  {
    path: '/tabsT/',
    component: TabsPageT,
    children: [
      {
        path: '',
        redirect: '/tabsT/tab1'
      },
      {
        path: 'tab1',
        component: () => import('@/views/Atendente/Tab1Page.vue')
      },
      {
        path: 'tab2',
        component: () => import('@/views/Atendente/Tab2Page.vue')
      },
      {
        path: 'tab3',
        component: () => import('@/views/Atendente/Tab3Page.vue')
      }
    ]
  },
  {
    path: '/tabsC/',
    component: TabsPageC,
    children: [
      {
        path: '',
        redirect: '/tabsC/tab1'
      },
      {
        path: 'tab1',
        component: () => import('@/views/Cliente/Tab1Page.vue')
      },
      {
        path: 'tab2',
        component: () => import('@/views/Cliente/Tab2Page.vue')
      },
      
    ]
  }
]

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes
})

export default router
