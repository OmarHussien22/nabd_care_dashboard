import 'package:care_desk/src/Super/Controllers/Resources/get/get_controller_interface.dart';

/// A page-based pagination controller for data tables.
///
/// Unlike [PaginationController] which uses a scroll-based infinite-load
/// strategy, this controller exposes explicit [goToPage] / [nextPage] /
/// [previousPage] methods that map directly to the table's page buttons.
///
/// Subclasses must implement [fetchPage] to perform the actual network call
/// for the given page number.
abstract class PaginationTableController<T> extends GetControllerInterface<T> {
  /// The page that is currently displayed in the table (1-indexed).
  int currentPage = 1;

  /// Whether a page-change request is currently in flight.
  bool paginationLoading = false;

  // ── Derived helpers ──────────────────────────────────────────────────────

  /// Total number of pages returned by the last successful response.
  int get totalPages => state.pagination?.last ?? 1;

  /// Returns true when there is a next page to navigate to.
  bool get hasNextPage => currentPage < totalPages;

  /// Returns true when there is a previous page to navigate to.
  bool get hasPreviousPage => currentPage > 1;

  // ── Abstract ─────────────────────────────────────────────────────────────

  /// Called every time the user changes the page.
  ///
  /// The implementation should call its use-case / repository with [page]
  /// as the page query-parameter and emit the resulting [DataState].
  Future<void> fetchPage(int page);

  // ── Navigation ───────────────────────────────────────────────────────────

  /// Navigate to an arbitrary [page] number.
  ///
  /// Ignores the call when [page] is already the [currentPage] or when a
  /// request is already in progress.
  Future<void> goToPage(int page) async {
    if (paginationLoading) return;
    if (page == currentPage) return;
    if (page < 1 || page > totalPages) return;

    paginationLoading = true;
    currentPage = page;
    update();

    await fetchPage(page);

    paginationLoading = false;
    update();
  }

  Future<void> nextPage() => goToPage(currentPage + 1);

  Future<void> previousPage() => goToPage(currentPage - 1);
}
