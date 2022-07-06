import Home from './pages/Home.vue';
import Contact from './pages/ContactUs.vue'
import CourseDetail from './pages/CourseDetail.vue'
// import TotalUserToSiteo from './components/totalUserToSite.vue'
import AddCourseToDo from './pages/AddCourseToDo.vue'
import CourseToDo from './pages/CoursesToDo.vue'
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
        path: '/mycourses',
        component: CourseToDo
    },
    {
        path: '/yyy',
        component: AddCourseToDo
    },
    {
        path: '/courses/:id',
        component: CourseDetail
    },
    {
        path: '/Add',
        component: AddCourseToDo
    }
]