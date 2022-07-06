import Home from './pages/Home.vue';
import Contact from './pages/Courses.vue'
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
        path: '/courses',
        component: Contact
    },
    {
        path: '/todo',
        component: CourseToDo
    },
    {
        path: '/add',
        component: AddCourseToDo
    },
    {
        path: '/courses/:id',
        component: CourseDetail
    },
]