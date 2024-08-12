import { sellBoardData, commBoardData } from '../../choisojin/js/boardData.js';

export function search() {
    var keyword = document.getElementById("searchInput").value;
    var searchResultsDiv = document.getElementById("searchResults");
    searchResultsDiv.innerHTML = "";

    var board1Count = searchInBoard("상품등록", keyword, searchResultsDiv);
    var board2Count = searchInBoard("커뮤니티", keyword, searchResultsDiv);
    var totalCount = board1Count + board2Count;

    searchResultsDiv.innerHTML = "<p class='totCnt'>총 검색 결과 수: " + totalCount + "개</p><br />" + searchResultsDiv.innerHTML;
}

function searchInBoard(boardName, keyword, searchResultsDiv) {
    var searchResults = findPostsInBoard(boardName, keyword);
    var tableHTML = "<div class='table-wrapper'><table class='search-table'>";
    tableHTML += "<tr><th>" + boardName + "게시판 검색 결과:</th></tr>";

    searchResults.forEach(function(post) {
        var highlightedTitle = post.title.replace(new RegExp(keyword, 'gi'), "<span class='highlight'>" + keyword + "</span>");
        var highlightedContent = post.content.replace(new RegExp(keyword, 'gi'), "<span class='highlight'>" + keyword + "</span>");
        var filterPost = "<tr><td class='filterTitle'><a href='#'><span>" + highlightedTitle + "</span></a></td></tr>";
        filterPost += "<tr><td class='filterContent'><span>" + highlightedContent + "</span></td></tr>";
        tableHTML += filterPost;
    });

    tableHTML += "</table></div><br /><hr /><br />";
    searchResultsDiv.insertAdjacentHTML('beforeend', tableHTML);
    return searchResults.length;
}

var board1Posts = sellBoardData;
var board2Posts = commBoardData;

function findPostsInBoard(boardName, keyword) {
    var posts;
    if (boardName === "상품등록") {
        posts = board1Posts;
    } else if (boardName === "커뮤니티") {
        posts = board2Posts;
    }

    return posts.filter(function(post) {
        return post.title.includes(keyword) || post.content.includes(keyword);
    });
}

// enter키로 검색
function handleEnterKeyPress(event) {
    if (event.key === 'Enter') {
        document.getElementById('searchBtn').click();
    }
}

document.getElementById('searchInput').addEventListener('keypress', handleEnterKeyPress);