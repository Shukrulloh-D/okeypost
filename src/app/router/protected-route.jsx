import { Navigate, Outlet } from 'react-router-dom';
import { useAuthStore } from '@/shared/store/auth-store';

export const ProtectedRoute = () => {
    const isAuth = useAuthStore((state) => state.isAuth);
    return isAuth ? <Outlet /> : <Navigate to="/login" replace />;
};
 