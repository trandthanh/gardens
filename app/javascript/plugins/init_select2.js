import $ from 'jquery';
import 'select2';

const initSelect2 = () => {
  $(document).ready(function() {
    $('.multiple-select').select2();
  });
};

export { initSelect2 };
