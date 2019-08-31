/* 변수 선언 */
var $editframe;
let jsframe;
/* 변수 선언 */

/* 설정 */
CKEDITOR.disableAutoInline = true;
/* /설정 */

/* 주요 기능별 메소드 정의 */
/* 호출 함수 관련 */
function $F(caller) {
  console.log('function $F 호출');
  var f = arguments.callee.caller;
  if (caller) f = f.caller;
  var pat = /^function\s+([a-zA-Z0-9_]+)\s*\(/i;
  pat.exec(f);
  var func = new Object();
  func.name = RegExp.$1;
  return func;
}

/*/호출 함수 관련 */

/* 주어진 객체의 에디터 타입 찾기 */
function find_editor_type(obj) {
  console.log('function find_editor_type 호출');
  if (obj.hasClass("text")) {
    return "text";
  }
  else if (obj.hasClass("table")) {
    return "table";
  }
}
/*/주어진 객체의 에디터 타입 찾기 */

/* 상단 네비게이션 바 작업 전 초기화 설정, 시작하기 버튼을 누를 경우 수행됨. */
function before_alert() {
  console.log('function before_alert 호출');

  // 다른 경고창이 띄워져 있을 경우
  // *=는 속성 안의 값이 이 값을 포함할 때이다.
  if ($("[id*=warnning][class*=show]").length > 0) {
     // 접을 수 있는 모든 요소를 접는다.
     // 펼쳐진 collapse는 class 내부에 show가 붙는다.
    $("[id*=warnning][class*=show]").collapse('hide');
  }
  // 타 상세 메뉴바 숨기기, 미구현된 기능을 말함.
  else if ($("[id*=details][class*=show]").length > 0) {
    $("[id*=details][class*=show]").collapse('hide');
  }
  else {
    return;
  }
}
/* /상단 네비게이션 바 작업 전 초기화 설정 */

/* Draggable DIV 스위치 설정 */
function draggable_switch(ONOFF, obj) {
  console.log('function draggable_switch 호출');
  // DIV 전체 적용
  if (obj == null) {
    if (ONOFF == 'ON') {
      $editframe.find('[class*="draggable"]').draggable({
        disabled: false
        // containment: ".container-fluid"
      });
    }
    else if (ONOFF == 'OFF') {
      $editframe.find('[class*="draggable"]').draggable({
        disabled:true
      });
    }
  }
  // 특정 객체 적용
  else {
    if (ONOFF == 'ON') {
      obj.draggable({
        disabled: false
      });
    }
    else if (ONOFF == 'OFF') {
      obj.draggable({
        disabled:true
      });
    }
  }
}
/*/Draggable DIV 스위치 설정 */

/* Resizable DIV 스위치 설정 */
function resizable_switch(ONOFF, obj) {
  console.log('function resizable_switch 호출');
  // DIV 전체 적용
  if (obj == null) {
    if (ONOFF == 'ON') {
      $editframe.find("[class~='ui-resizable']").resizable({
        disabled : false,
        autoHide : true
      });
      // $editframe.find("[class~='ui-resizable'] > div").attr('contenteditable', 'false');

    }
    else if (ONOFF == 'OFF') {
      $editframe.find("[class~='ui-resizable']").resizable({
        disabled : true,
        autoHide: false
      });
    }
  }
  // 특정 객체 적용
  else {
    if (ONOFF == 'ON') {
      obj.resizable({
        disabled : false,
        autoHide : true
      });
    } else if (ONOFF == 'OFF') {
      obj.resizable({
        disabled : true,
        autoHide: false
      });
    }
  }
}
/*/Resizable DIV 스위치 설정 */

/* PreventDefault 스위치 설정 */
function preventDefault_switch(ONOFF, obj) {
  console.log('function preventDefault_switch 호출');
  // DIV 전체 적용
  if (obj == null) {
    /*
    $('.form-control').focus(function() {
               $('#element').on('scroll touchmove mousewheel', function(e){
                   e.preventDefault();
                   e.stopPropagation();
           })
   });

   $('.form-control').focusout(function() {
        $('#element').unbind();
      });

    */
    if (ONOFF == 'ON') {
      // 일반 href 동작 중지
      $editframe.find("a, button").on('click', function(e) {
        e.preventDefault();
        e.stopPropagation();
      });

      // css 스크롤 동작 중지
      $editframe.find("[class*='js-scroll-trigger']").attr('temphref', function() {
        return $(this).attr('href');
      });
      $editframe.find("[class*='js-scroll-trigger']").removeAttr('href');
    }

    else if (ONOFF == 'OFF') {
      // href 동작 허용
      $editframe.find("a, button").unbind();

      // css 스크롤 동작 허용
      $editframe.find("[class*='js-scroll-trigger']").attr('href', function() {
        return $(this).attr('temphref');
      });
      $editframe.find("[class*='js-scroll-trigger']").removeAttr('temphref');
    }
  }
}
  /* /PreventDefault 스위치 설정 */

  // contenteditable 스위치 설정, 매개변수 ONOFF, javascript 변수.
function contenteditable_switch(ONOFF, obj) {
  console.log('function contenteditable_switch 호출');

  // DIV 전체 적용
  if (obj == null) {
    if (ONOFF == 'ON') {
      $editframe.find("[contenteditable='false']").attr('contenteditable', 'true');
      $editframe.find("[contenteditable='true']").one('mouseover', function (event) {
        CKEDITOR.inline(event.target, {
    			extraPlugins: 'sharedspace',
    			removePlugins: 'floatingspace,resize',
    			sharedSpaces: {
    				top: 'top',// jsframe.getElementById('top'), // string이 들어가야하는데.... 어떻게주지?
    				bottom: 'bottom'// jsframe.getElementById('bottom')
          }
        });

        /*
        CKEDITOR.appendTo(event.target, {
  				extraPlugins: 'sharedspace',
  				removePlugins: 'maximize,resize',
  				sharedSpaces: {
            top: jsiframe.getElementById('page-top'),
    				bottom: jsiframe.getElementById('bottom')
  				}
        }, event.target.innerHTML );*/
      });
      $editframe.find("[class~='ui-resizable']").on('click', function () {
        $(this).find("[contenteditable='true']").focus();
      });

      $editframe.find("[contenteditable='true']").on({
        focus: function () {
          $('#top').css('display', 'inline-block');
        },
        blur: function () {
          $('#top').css('display', 'none');
        }});
    }
    // 끌 때....
    else if (ONOFF == 'OFF') {
      $editframe.find("[contenteditable='true']").attr('contenteditable', 'false');
      $editframe.find("[class~='ui-resizable']").unbind();
      $editframe.find("[contenteditable='true']").unbind();
      $('#top').css('display', 'none');
    }
  }
  // 특정 객체 적용, javascript 객체를 매개변수로 받는다.
  else {
    if (ONOFF == 'ON') {
      obj.addEventListener("mouseover", function () {
        CKEDITOR.inline(obj, {
    			extraPlugins: 'sharedspace',
    			removePlugins: 'floatingspace,resize',
    			sharedSpaces: {
    				top: 'top',// jsframe.getElementById('top'), // string이 들어가야하는데.... 어떻게주지?
    				bottom: 'bottom'// jsframe.getElementById('bottom')
          }
        });
      })
    }
    else if (ONOFF == 'OFF') {
      obj.attr('contenteditable', 'false');
    }
  }
}
/* / contenteditable 스위치 설정*/

/* 상단 경고창 표시 관련 */
var pending = {};

// mySetTimeout(before_alert, 10000);
function mySetTimeout(callback, delay) {
  console.log('function mySetTimeout 호출');
  var t = setTimeout(function() { // setTimeout의 return값은 timerID로써, 이를 매개변수로 clearTime을 호출하면 타임아웃 전에 타이머를 해제할 수 있다.
    delete pending[t];
    // 객체의 상태 변화(이벤트)가 발생하였을 경우에 이러한 사실을 함수를 통해 전달하게 되는데, 이를 콜백 함수라고 한다.
    // callback 이라는 단어는 노드나 자바스크립트에서 특수하게 사용되는 예약어(reserved word)가 아님을 명심하자.
    // 동작을 가장 잘 표현하고 있기 때문에 범용적으로 사용되고 있는 단어이다.
    // closer의 역할도 수행한다.
    // 여기에서는 시간이 다 되고, 타이머가 수행되면 펼쳐져있는 collapse를 접어주기 위해 호출하고 있다.
    callback()
  }, delay)
  pending[t] = 1;
}

function clearAllTimeouts() {
  console.log('function clearAllTimeouts 호출');
  for (var t in pending) // 여기에서 t객체는 timerID 객체가 될 것이다.
    if (pending.hasOwnProperty(t)) { //  명칭을 지닌 프로퍼티를 포함하는지를 판단해 true, false로 반환한다.
      console.log('t = ' + t);
      console.log(pending[t]);

      clearTimeout(t); // 한 번 실행되는 timer를 제거한다.
      // delete 연산자는 오브젝트로부터 해당 프로퍼티를 제거한다. 제거한 객체의 참조를 어디에서도 사용하지 않는다면 나중에 자원을 회수합니다.
      delete pending[t];
    }
}
/* /상단 경고창 표시 관련 */

/*/주요 기능별 메소드 정의 */

/* 페이지 편집 모드 스위치 */
function page_edit_mode_switch(ONOFF) {
  console.log('function page_edit_mode_switch 호출');
  // [속성~=값] 속성 안의 값이 특정 단어로 시작하는 문서 객체를 선택함. 화면 왼쪽 상단의 시작하기 버튼.
  var clicked_button = $("[class~=edit-mode-switch]");
  /* 페이지 편집 모드 ON */
  if (ONOFF == 'ON') {
    console.log("페이지 편집 모드 시작");

    // focusout는 의미 그대로 엘리먼트가 포커스를 잃었을 때 발생되는 이벤트이다.
    // 같은 용도로 사용되는 이벤트로 blur가 있는 것이다. 둘 사이의 차이점은 버블링 여부이다.
    // focusout는 버블링이 일어나고, blur는 버블링이 일어나지 않는다.
    // 캡처링 - window 로부터 이벤트가 발생한 요소까지 이벤트를 전파한다.
    // 버블링 - 이벤트가 발생한 요소부터 window 까지 이벤트를 전파한다.
    clicked_button.blur();

    //버튼 효과 및 문구 변경
    clicked_button.removeClass("btn-secondary");
    clicked_button.addClass("btn-light");
    clicked_button.html('종료하기');

    // 페이지 편집 메뉴창 토글
    // d-flex를 사용하여 전체 그리드 구조를 구성하는 것이 좋습니다
    // .toggleClass()로 선택한 요소에 클래스(Class) 값을 넣었다 뺐다 할 수 있습니다.
    $("[class~=d-flex]").toggleClass("toggled");

    // 드래그 및 리사이즈 기능 전체 설정
    draggable_switch('ON');
    resizable_switch('ON');
    contenteditable_switch('ON');
    preventDefault_switch('ON');
  }
  /*/페이지 편집 모드 ON */
  /*페이지 편집 모드 OFF */
  else if (ONOFF == 'OFF') {

    console.log("페이지 편집 모드 종료 시도");

    clicked_button.blur();

    // 종료 전 다른 에디터가 실행 중인 경우
    if ($(document).find("[class~=editor]").length > 0) {
      console.log("종료 전 에디터가 실행 중인 경우")

      // 경고창 표시
      $("#using-editor-warnning").collapse('show');
      return;
    }
    // 실행중인 에디터가 없는 경우
    else {
      console.log("실행 중인 에디터가 없는 경우")

      //버튼 효과 및 문구 변경
      clicked_button.removeClass("btn-light");
      clicked_button.addClass("btn-secondary");
      clicked_button.html('시작하기');

      //페이지 편집 메뉴창 토글
      $("[class~=d-flex]").toggleClass("toggled");

      // 전체 드래그 기능 해제
      draggable_switch('OFF');
      resizable_switch('OFF');
      preventDefault_switch('OFF');
      contenteditable_switch('OFF');

      console.log("페이지 요소의 드래그 기능 제거 완료");
      console.log("페이지 편집 모드 종료 완료");
    }
  }
  /*/페이지 편집 모드 OFF */
}
/*/페이지 편집 모드 스위치 */
/* 쿄쿄 */

/* / 쿄쿄 */
$(document).ready( function() {
  // CKEDITOR.disableAutoInline = true;
  $editframe = $('#iframe').contents();
  jsframe = document.getElementById('iframe').contentWindow.document;
      /*
       * 페이지가 로드될때 메인페이지 정보를 불러온다.
       * 동작 화면의 크기가 모바일일 경우 데스크톱 사용을 권장하는 알림을 띄우고,
       * 인덱스 페이지로 돌려보낸다.
       * */
    })
    /* COLLAPSE 관련 */
    // 전체 토글 실행 시,
    // show.bs.collapse는 show 메서드가 실행되는 동시에 실행된다.
    .on("show.bs.collapse", ".collapse", function() {
      console.log("상단 네비게이션 바 초기화");
      // 상단 네비게이션 바 초기화
      before_alert();
    })
    // 토글 진행 후
    // 이 이벤트는 접힌 요소가 사용자에게 표시 될 때 시작됩니다 (CSS 전환이 완료 될 때까지 기다림).
    .on('shown.bs.collapse', function() {
      clearAllTimeouts();
      mySetTimeout(before_alert, 10000);
    })
    /*/COLLAPSE 관련 */

    // 더블 클릭 이벤트 설정
    .on("dblclick", ".draggable", function() {

      if (event.stopImmediatePropagation) event.stopImmediatePropagation(); //MOZILLA
      else event.isImmediatePropagationEnabled = false; //IE

      if (event.preventDefault) event.preventDefault(); //MOZILLA
      else event.returnValue = false; //IE

      // 에디터가 켜져있지 않을 경우, 더블 클릭시 에디터 실행 및 ID 값 변경
      // .find(selector) - 어떤 요소의 하위 요소 중 특정 요소를 찾는 메서드
      // 엘리먼트 집합에서 매개변수로 지정된 CSS 클래스를 지닌 엘리먼트가 존재하는지 알려준다.
      if ($(this).find("*").hasClass("OFF")) {

        // 더블클릭 상태로 전환
        $(this).addClass("dblclicked");

        // 에디터는 한 개만 운용 가능하도록 설정
        // 동일 에디터가 실행 중이지 않는 경우
        if (check_same_editor($(this).find("[class~=OFF]")) == null) {
          console.log("동일 에디터가 실행 중이지 않는 경우");

          // 텍스트 에디터 실행
          if ($(this).hasClass("text")) {

            // 설정값 변경 및 스위치 ON
            editor_switch('ON', $(this).find('[class~=plain]'));
          }
          // 테이블 에디터 실행
          else if ($(this).hasClass("table")) {

            // 설정값 변경 및 스위치 ON
            editor_switch('ON', $(this).find("[class~=plain]"));
          }

          // 더블클릭 상태 해제
          $("[class~=draggable][class~=dblclicked]").removeClass("dblclicked");
        }
        // 이미 동일 에디터가 실행 중인 경우
        else {
          return;
        }
      }
      // 에디터가 켜져있을 경우, 더블 클릭시 에디터에 포커스
      else if ($(this).find("*").hasClass("ON")) {

        // 텍스트 에디터 더블 클릭 시
        if ($(this).hasClass("text")) {

          console.log("텍스트 에디터 포커스");
          $(".jqte_editor").focus();
        }
        //테이블 더블 클릭 시
        else if ($(this).hasClass("table")) {

          console.log('테이블 에디터 포커스');
          $(this).find("[class~=editor][class~=table]").focus();

        }

        // 더블클릭 상태 해제
        $("[class~=draggable][class~=dblclicked]").removeClass("dblclicked");
      }
    })
    // 페이지 편집 토글 버튼 클릭 시
    .on("click", ".edit-mode-switch", function(e) {

      event.preventDefault();

      if ($(this).hasClass("btn-light")) {
        // 알림창 표시
        $("#page-edit-mode-off-warnning").collapse('show');
      } else {
        // 알림창 표시
        $("#page-edit-mode-on-warnning").collapse('show');
      }
    })
    // 페이지 탭 추가 생성
    .on("click", "#new-page", function(e) {

      var page_default_name = ["첫번째", "두번째", "세번째"];
      var now_page_default_name = page_default_name[$("[class~=page-tab-group]").find("[class~=page-tab]").length];
      var now_page_tab_size = $("[class~=page-tab-group]").find("[class~=page-tab]").length;
      $(this).blur();
      event.preventDefault();

      console.log(now_page_tab_size);
      //페이지 탭 생성은 총 3개까지만 한정
      if (now_page_tab_size < 3) {

        //JSON 오브젝트 생성
        var json_object = new Object();
        //JSON 오브젝트에 PageVO 모델 바인딩
        json_object.page_name = now_page_default_name

        //AJAX를 통해 유저별 페이지 탭 정보 저장
        $.ajax({
          type: "POST",
          dataType: 'json',
          data: json_object,
          async: false,
          url: "/page/new_tab",
          success: function(data) {

            if (data.message == "true")
              $("[id~=new-page]").before(
                '<button type="button" class="btn btn-light page-tab">' +
                page_default_name[$("[class~=page-tab-group]").find("[class~=page-tab]").length] +
                '</button>');
          }
        });

        //페이지 추가 생성을 막기 위해 마지막 페이지 탭 생성시 버튼 삭제
        if (now_page_tab_size == 2) {
          $("[id=new-page]").remove();
        }
      }
    })
    // 페이지 탭 클릭 이벤트
    .on("click", ".page-tab", function(e) {

      event.preventDefault();
      $(this).blur();

      /*
       * 페이지 편집 모드가 활성화 되어 있는 경우 경고창 출력
       * */

      if ($("[class~=d-flex]").hasClass("toggled")) {

        //이미 활성화 되어있는 페이지를 클릭했을 경우
        if ($(this).hasClass("actived")) {

          return;
        }
        //다른 페이지 탭을 클릭했을 경우
        else {

          //이미 활성화 되어있는 페이지 탭 비활성화
          $("[class~=page-tab-group]").find("[class~=actived]")
            .removeClass("btn-primary").removeClass("actived")
            .addClass("btn-light");

          $(this).removeClass("btn-light")
            .addClass("btn-primary").addClass("actived");

          //북마크 생성을 위한 페이지 탭 번호 갱신
          var actived_page_tab_no = parseInt($("[class~=page-tab-group]").find("[class~=actived]").attr("id"));
          var page_no = $("[id~=input-bookmark-details-warnning]").find("[id~=page_no]");
          page_no.val(actived_page_tab_no);

          var bookmark_scrolltop = $("[id~=input-bookmark-details-warnning]").find("[id~=bookmark_scrolltop]");
          bookmark_scrolltop.val(0);

          /*
           * 다른 페이지 탭을 클릭했을 때, 해당 페이지에 저장해놓은 상태를 불러오기 위해
           * AJAX를 통해 페이지 정보를 받아와서 HTML을 수정한다.
           * */

          //JSON 오브젝트 생성
          var json_object = new Object();

          //JSON 오브젝트에 PageVO 모델 바인딩
          json_object.page_name = $(this).html();

          //AJAX를 통해 JSON 오브젝트 전달
          $.ajax({
            type: "POST",
            dataType: 'json',
            data: json_object,
            url: "/page/load",
            success: function(data) {

              //기존 페이지 컨텐츠를 제거하고 불러온 컨텐츠를 적용시킨다.
              $("[class~=container-fluid]").empty();
              $("[class~=container-fluid]").append(data.page_content);
            }
          });
        }
      }
      //페이지 편집 모드가 활성화중인 경우
      else {

        // 경고창 표시
        $("#other-tab-warnning").collapse('show');
        return;
      }
    })

function Page_Edit_Mode_ON_Warnning(YN) {
  console.log('function Page_Edit_Mode_ON_Warnning 호출');
  // 상단 네비게이션 바 초기화
  before_alert();

  // 파라미터의 값이 'Y'일 경우
  if (YN == 'Y') {
    page_edit_mode_switch('ON');
  }
  else {
    return;
  }
}

function Page_Edit_Mode_OFF_Warnning(YN) {
  console.log('function  Page_Edit_Mode_OFF_Warnning 호출');
  // 상단 네비게이션 바 초기화
  before_alert();

  // 페이지
  if (YN == 'Y') {

    page_edit_mode_switch('OFF');
  } else {
    return;
  }
}

function Using_Editor_Warnning(YN) {
  console.log('function Using_Editor_Warnning 호출');
  // 상단 네비게이션 바 초기화
  before_alert();

  // 비저장 종료 선택
  if (YN == 'Y') {

    // 실행중인 에디터 전체 종료
    $(document).find("[class~=editor]").closest("[class^=draggable]").remove();

    // 포커스 제거 및 편집 모드 토글 버튼 색상 변경
    $("#menu-toggle").attr('class', 'btn btn-secondary');
    $("#wrapper").toggleClass("toggled");

    // 전체 드래그 기능 및 리사이즈 해제
    draggable_switch('OFF');
    resizable_switch('OFF');
    console.log("페이지 요소의 드래그 기능 제거 완료");
    console.log("페이지 편집 모드 종료 완료");
  }
  // 비저장 종료 거부
  else {

    console.log("페이지 편집 모드 종료 거부");
    return;
  }
}

function Same_Editor_Warnning(YN, id) {
  console.log('function Same_Editor_Warnning 호출');
  // 상단 네비게이션 바 초기화
  before_alert();

  // 비저장 종료 선택
  if (YN == 'Y') {

    // 이미 실행중인 동일 에디터 제거
    check_same_editor($("[class~=draggable][class~=dblclicked]").find('.plain')).remove();

    // 설정값 변경 및 스위치 ON
    editor_switch('ON', $("[class~=draggable][class~=dblclicked]").find('.plain'));

    // 더블클릭 상태 해제
    $("[class~=draggable][class~=dblclicked]").removeClass("dblclicked");

  }
  // 비저장 종료 거부
  else {
    console.log("페이지 편집 모드 종료 거부");
    return;
  }
}

function Show_Add_Bookmark_Warnning() {

  // 경고창 표시
  $("#add-bookmark-warnning").collapse('show');
  return;
}

function Add_Bookmark_Warnning(YN) {

  // 상단 네비게이션 바 초기화
  before_alert();

  // 북마크 생성
  if (YN == 'Y') {

    // 경고창 표시
    $("#input-bookmark-details-warnning").collapse('show');
    return;
  }
}

function Show_Bookmark_Page(bookmark_no) {

  /* INPUT 값으로 미리 지정되어 있는 북마크 번호를 기준으로,
   * 페이지 정보를 조회한다. */

  /*
   * 다른 페이지 탭을 클릭했을 때, 해당 페이지에 저장해놓은 상태를 불러오기 위해
   * AJAX를 통해 페이지 정보를 받아와서 HTML을 수정한다.
   * */

  //JSON 오브젝트 생성
  var json_object = new Object();

  //JSON 오브젝트에 PageVO 모델 바인딩
  json_object.bookmark_no = bookmark_no;

  //AJAX를 통해 JSON 오브젝트 전달
  $.ajax({
    type: "POST",
    dataType: 'json',
    data: json_object,
    url: "/bookmark/load",
    success: function(data) {

      console.log(data.page_content);
      console.log(data.bookmark_scrolltop);

      //이미 활성화 되어있는 페이지 탭 비활성화
      $("[class~=page-tab-group]").find("[class~=actived]")
        .removeClass("btn-primary").removeClass("actived")
        .addClass("btn-light");

      $("[class~=page-tab-group]").find("[id~=" + data.page_no + "]").removeClass("btn-light")
        .addClass("btn-primary").addClass("actived");

      //기존 페이지 컨텐츠를 제거하고 불러온 컨텐츠를 적용시킨다.
      $("[class~=container-fluid]").empty();
      $("[class~=container-fluid]").append(data.page_content);
    }
  });
}

/*

// CKEDITOR
// CKEDITOR.config기본 구성 설정을 저장합니다. 이 인스턴스에 대한 변경 사항은 특정 인스턴스에 대해 다르게 지정되지 않은 경우 모든 편집기 인스턴스에 반영됩니다.
// CKEDITOR.config.resize_enabled = true;
CKEDITOR.disableAutoInline = true;

function createEditor() { //  draggable='true' ondragstart='drag(event)' onmouseover='over(this)' onmouseout='out(this)'
  var div = document.createElement('div');
  div.innerHTML = "글을 작성해 주세요!";
  div.setAttribute('contenteditable', true);
  div.setAttribute('draggable', true);

  CKEDITOR.on( 'instanceCreated', function( event ) {
    var editor = event.editor,
    element = editor.element;

    // Customize editors for headers and tag list.
    // These editors don't need features like smileys, templates, iframes etc.
    if ( element.is( 'h1', 'h2', 'h3' ) || element.getAttribute( 'id' ) == 'taglist' ) {
      // Customize the editor configurations on "configLoaded" event,
      // which is fired after the configuration file loading and
      // execution. This makes it possible to change the
      // configurations before the editor initialization takes place.
      editor.on( 'configLoaded', function() {

        // Remove unnecessary plugins to make the editor simpler.
        editor.config.removePlugins = 'colorbutton,find,flash,font,' +
          'forms,iframe,image,newpage,removeformat,' +
          'smiley,specialchar,stylescombo,templates';

        // Rearrange the layout of the toolbar.
        editor.config.toolbarGroups = [
          { name: 'editing',		groups: [ 'basicstyles', 'links' ] },
          { name: 'undo' },
          { name: 'clipboard',	groups: [ 'selection', 'clipboard' ] },
          { name: 'about' }
        ];
      });
    }
  });

  $(".container-fluid").prepend(div);
  div.addEventListener('dragstart', drag);
  CKEDITOR.inline(div);
  // CKEDITOR - OBJ,  이것이 API 진입점입니다. 전체 CKEditor 코드는이 객체에서 실행됩니다.
}
*/

function insertText() { //  draggable='true' ondragstart='drag(event)' onmouseover='over(this)' onmouseout='out(this)'
  let resizable = document.getElementById('iframe').contentWindow.document.createElement('div');
  let contenteditable = document.getElementById('iframe').contentWindow.document.createElement('div');

  console.log('호출은되냐...');
  // resizable.setAttribute('id', 'insert');
  resizable.setAttribute('id', 'insert');
  resizable.setAttribute('class', 'ui-resizable draggable');
  contenteditable.innerHTML = "글을 입력해주세요";
  contenteditable.setAttribute('contenteditable', true);
  resizable.appendChild(contenteditable);

/*
  resizable.style.position = 'relative';

  contenteditable
  contenteditable.style.position = 'absolute';
  contenteditable.style.top = "50%";
  contenteditable.style.left = "50%";
  contenteditable.style.transform = "translate(-50%, -50%)";
*/

// 여기하고있었따.
  $editframe.find('body').append(resizable);
  $editframe.find('#insert').css({
    "position":'absolute',
    "top":(($(window).height() - $('#insert').outerHeight()) / 2 + $('#iframe').window.scrollTop()) + 'px',
    "left":(($(window).width() - $('#insert').outerWidth()) / 2 + $(window).scrollLeft()) + 'px',
  });

/*
  $editframe.find('#insert').css({
    "position":"absolute",
    "top":"50%",
    "left":"50%",
    "margin":"-50px 0 0 -50px"
  });
/*
  resizable.removeAttribute('id');
/*
  let left = $editframe.find('#insert').offset().left;
  let top = $editframe.find('#insert').offset().top;
*/
  // 전체 스타일 제거
  // $editframe.find('#insert').removeAttr('style');
  // 위치..
  /*$editframe.find('#insert').offset({
    left:left,
    top:top
  });
  */
  // 추가.. 변수는 자바스크립트 변수..


/*
  contenteditable_switch('ON', contenteditable);
  resizable_switch('ON', $editframe.find('#insert'));
  draggable_switch('ON', $editframe.find('#insert'));
*/
/*
  CKEDITOR.on( 'instanceCreated', function( event ) {
    var editor = event.editor,
    element = editor.element;

    // Customize editors for headers and tag list.
    // These editors don't need features like smileys, templates, iframes etc.
    if ( element.is( 'h1', 'h2', 'h3' ) || element.getAttribute( 'id' ) == 'taglist' ) {
      // Customize the editor configurations on "configLoaded" event,
      // which is fired after the configuration file loading and
      // execution. This makes it possible to change the
      // configurations before the editor initialization takes place.
      editor.on( 'configLoaded', function() {

        // Remove unnecessary plugins to make the editor simpler.
        editor.config.removePlugins = 'colorbutton,find,flash,font,' +
          'forms,iframe,image,newpage,removeformat,' +
          'smiley,specialchar,stylescombo,templates';

        // Rearrange the layout of the toolbar.
        editor.config.toolbarGroups = [
          { name: 'editing',		groups: [ 'basicstyles', 'links' ] },
          { name: 'undo' },
          { name: 'clipboard',	groups: [ 'selection', 'clipboard' ] },
          { name: 'about' }
        ];
      });
    }
  });
*/

}
