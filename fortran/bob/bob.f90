module bob
  implicit none
contains

  function hey(statement)
    character(100) :: hey
    character(len=*), intent(in) :: statement
    integer :: statement_length
    character(1) :: last_character
    logical :: question
    logical :: all_caps

    statement_length = LEN_TRIM(statement)

    if (statement_length == 0) then
       hey = 'Fine. Be that way!'
    else
       last_character = statement(statement_length:statement_length)
       question = (last_character == '?')
       all_caps = is_all_caps(statement)

       if (all_caps .and. question) then
          hey = "Calm down, I know what I'm doing!"
       else if (all_caps) then
          hey = 'Whoa, chill out!'
       else if (question) then
          hey = 'Sure.'
       else
          hey = 'Whatever.'
       end if
    end if
  end function hey

  function is_all_caps(statement)
    logical :: is_all_caps
    character(len=*), intent(in) :: statement
    logical :: has_upper
    logical :: has_lower
    integer :: i

    has_upper = .FALSE.
    has_lower = .FALSE.

    do i = 1, LEN_TRIM(statement)
      if (statement(i:i) >= 'A' .and. statement(i:i) <= 'Z') then
          has_upper = .TRUE.
       end if
       if (statement(i:i) >= 'a' .and. statement(i:i) <= 'z') then
          has_lower = .TRUE.
       end if
    end do

    is_all_caps = (has_upper .and. .not. has_lower)
  end function is_all_caps

end module bob
