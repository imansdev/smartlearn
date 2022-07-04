import Home from './pages/Home.vue';
import Contact from './pages/ContactUs.vue'
import CourseDetail from './pages/CourseDetail.vue'
import TotalUserToSiteo from './components/totalUserToSite.vue'
import AddToDoCourse from './pages/AddToDoCourse.vue'
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
        path: '/contact',
        component: Contact
    },
    {
        path: '/yyy',
        component: TotalUserToSiteo
    },
    {
        path: '/courses/:id',
        component: CourseDetail
    },
    {
        path: '/Add',
        component: AddToDoCourse
    }
]