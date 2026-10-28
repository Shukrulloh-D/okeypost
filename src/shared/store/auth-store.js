import { create } from 'zustand';
import { persist } from 'zustand/middleware';
export const useAuthStore = create(persist((set) => ({
  user: null, isAuth: false,
  login: (data) => set({ user: data, isAuth: true }),
  logout: () => set({ user: null, isAuth: false }),
}), { name: 'okeypost-auth' }));
