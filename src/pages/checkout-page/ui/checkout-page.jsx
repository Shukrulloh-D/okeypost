import { useForm } from 'react-hook-form';
import { Button } from '@/shared/ui/button';
import { Input } from '@/shared/ui/input';
import { Link } from 'react-router-dom';
import { ArrowLeft, Plus, Upload, Save } from 'lucide-react';

export default function CheckoutPage() {
  const { register, handleSubmit } = useForm();
  const onSubmit = (data) => { alert('Заказ оформлен!'); };
 
  return (
    <div>
      <Link to="/orders" className="flex items-center gap-2 text-muted mb-6 text-sm hover:text-primary-blue">
        <ArrowLeft size={16}/> Назад к заказам
      </Link>
      <h2 className="title-h2 mb-2">Оформление заказа</h2>
      <h3 className="text-lg font-bold mt-6 mb-4">Товар #1</h3>

      <form onSubmit={handleSubmit(onSubmit)} className="bg-white p-8 rounded-2xl">
        <Input label="Ссылка на страницу с товаром*" register={register('url')} placeholder="https://..." />
        <Input label="Название товара*" register={register('name')} placeholder="Введите название" />

        <div className="grid-2 mt-4">
          <Input label="Количество*" type="number" register={register('qty')} placeholder="1" />
          <Input label="Размер" register={register('size')} placeholder="M / L / XL" />
        </div>
        <div className="grid-2 mt-4">
          <Input label="Цвет" register={register('color')} placeholder="Красный" />
          <Input label="Цена на сайте*" type="number" register={register('price')} placeholder="£" />
        </div>

        <div className="mt-4">
          <label className="block text-sm font-medium text-muted mb-2">Комментарии</label>
          <textarea {...register('comment')} rows="4" className="w-full p-4 border border-gray-200 rounded-lg text-sm outline-none focus:border-primary-blue" placeholder="Комментарий к заказу..."></textarea>
        </div>

        <div className="flex flex-wrap gap-3 mt-8">
          <Button type="submit">Отправить</Button>
          <button type="button" className="btn btn-outline" onClick={() => alert('Добавление товара')}>
            <Plus size={16}/> Добавить товар
          </button>
          <button type="button" className="btn btn-outline" onClick={() => alert('Загрузка чека')}>
            <Upload size={16}/> Загрузить чек
          </button>
          <button type="button" className="btn btn-outline" onClick={() => alert('Сохранено как черновик')}>
            <Save size={16}/> Сохранить
          </button>
        </div>
      </form>
    </div>
  );
}
