import Home from './pages/Home.vue';
import Contact from './pages/ContactUs.vue'
import CourseDetail from './pages/CourseDetail.vue'
export default [
    {
        path: '/',
        redirect: '/home'
    },
    {
        path: '/home',
        component: Home
    },
    {
        path : '/contact',
        component: Contact
    },   {
        path: '/yyy',
        component: CourseDetail,
      }
]