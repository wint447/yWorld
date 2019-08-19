import $ from 'jquery';
import env from './base/core/env';
import lists from './base/core/lists';
import Context from './base/Context';

/* $.fn.extend - Jquery의 사용자 정의 함수를 제작 할 수 있도록 도와준다. */
$.fn.extend({
  /**
   * Summernote API
   *
   * @param {Object|String}
   * @return {this}
   */
  summernote: function() {
    // 함수에는 arguments라는 변수에 담긴 숨겨진 유사 배열이 있다. 이 배열에는 함수를 호출할 때 입력한 인자가 담겨있다.
    const type = $.type(lists.head(arguments)); // $.type - object의 type을 문자열로 반환한다.
    const isExternalAPICalled = type === 'string'; // const - 변수의 재선언과 재설정이 불가능하다.
    const hasInitOptions = type === 'object'; //  === - a가 b의 '값'과 '타입/형식?'이 정확하게 같은지 판단해서 true/false를 반환.

    /* 제이쿼리의 extend()는 다수의 객체를 하나의 객체로 합치는 merge기능을 수행할 수 있습니다.
    만약 두 개 이상의 객체를 하나로 합치려는 경우 extend()를 사용하여 새로운 객체로 만들 수 있다. */
    const options = $.extend({}, $.summernote.options, hasInitOptions ? lists.head(arguments) : {}); // 인자값이 object이면 그 object를 추가해줌.

    // Update options
    // contents : 버튼에 표시될 내용을 지정한다.
    // tooltip : 마우스 오버했을 때 나오는 tooltip 을 지정한다.
    // click : 클릭 이벤트 발생시 실행할 callback 을 지정한다.

    options.langInfo = $.extend(true, {}, $.summernote.lang['en-US'], $.summernote.lang[options.lang]);
    options.icons = $.extend(true, {}, $.summernote.options.icons, options.icons);
    options.tooltip = options.tooltip === 'auto' ? !env.isSupportTouch : options.tooltip;

    // each 루프 내에서 this의 포인터는 jQuery 오브젝트가 아닌 DOM 오브젝트이다.
    // 만약 each내에서 jQuery의 메소드를 사용하고 싶다면, $(this)로 jQuery오브젝드로 콜을 해야 한다.
    this.each((idx, note) => { // this, 호출하는 jquery값을 가져옴
      const $note = $(note);
      if (!$note.data('summernote')) {
        const context = new Context($note, options);
        $note.data('summernote', context);
        $note.data('summernote').triggerEvent('init', context.layoutInfo);
      }
    });

    // DOM 요소 세트를 나타내는 jQuery 객체가 주어지면 .first()메소드는 해당 세트의 첫 번째 요소에서 새 jQuery객체를 생성한다.
    const $note = this.first();
    if ($note.length) { // javascript의 경우 숫자 0 (숫자 리터럴) , -0이 false로 간주됨.
      const context = $note.data('summernote'); // $note의 data값을 읽어오거나, key와 value값의 형태로 값을 설정해 줄 수 있다.
      if (isExternalAPICalled) {
        return context.invoke.apply(context, lists.from(arguments));
      } else if (options.focus) {
        context.invoke('editor.focus');
      }
    }

    return this;
  },
});
