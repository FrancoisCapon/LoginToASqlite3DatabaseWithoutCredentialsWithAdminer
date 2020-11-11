<?php
/**
 * Adminer plugin to login to a sqlite3 database without credentials
 *
 * This plugin overwrite the Adminer::login() and Adminer::loginForm() methods.
 * Warning : don't use it in a production environment! 
 *
 * @link https://www.adminer.org/en/extension/#api
 *
 * @author François Capon
 * @license http://http://opensource.org/licenses/MIT, The MIT License (MIT)
 * @version 1.0
 * 
 */
class FCSqliteConnectionWithoutCredentials {

    /**
    * Overwrite the Adminer::loginForm() method : Print login form
    *
    * @uses adminer() - Get Adminer object   
    * @uses Adminer::loginFormField(...) - Get login form field        
    * @return return always true
     */
    function loginForm() {
        $adminer = adminer();
        echo '<div class="error">'.lang('Warning: don\'t use it in a production environment!').'</div>';
        echo "<table cellspacing='0' class='layout'>\n";
        echo '<input type="hidden" name="auth[driver]" value="sqlite">';
        echo $adminer->loginFormField('db', '<tr><th>' . lang('Database') . '<td>',
          '<input name="auth[db]" value="' . h($_GET["db"]) . '" autocapitalize="off">' . "\n");
        echo "</table>\n";
        echo "<p><input type='submit' value='" . lang('Login') . "'>\n";
        return true;
    }

    /**
    * Overwrite the Adminer::login(string $login, string $password) method: Authorize the user
    *
    * @return return always true
     */
    function login($login, $password) {
        return true;
    }
}
