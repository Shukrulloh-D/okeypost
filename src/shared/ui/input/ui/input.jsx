import './input.css';
export const Input = ({ label, error, register, ...props }) => (
  <div className="input-group">
    {label && <label>{label}</label>}
    <input className={error ? 'error' : ''} {...register} {...props} />
    {error && <span className="error-text">{error.message}</span>}
  </div>
);
