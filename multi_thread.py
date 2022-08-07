
import threading


def threaded(fn):
    def wrapper(*args, **kwargs):
        thread = threading.Thread(target=fn, args=args, kwargs=kwargs)
        thread.start()
        return thread
    return wrapper

@threaded
def _run_spot_first_thread(stop_event, market_coin):
  pass

def run_spot_future(self, market_list, USD_LIMIT):
    """
        all in 1
    """
    # initial event for stopping threads
    stop_event = threading.Event()
    threads = []

    # starting threads for each coin
    for market in self.market_list:
        threads.append(self._run_spot_first_thread(stop_event, market["coin"]))
        threads.append(self._run_future_second_thread(stop_event, market["coin"]))

    # try to stop all threads
    try:
        while 1:
            time.sleep(5)
    except KeyboardInterrupt:
        stop_event.set()
        print("\nWEN RUG?")

    for thread in threads:
        thread.join()

    print("\nALL DONE.")
