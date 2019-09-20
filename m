Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 73053B950E
	for <lists+linux-audit@lfdr.de>; Fri, 20 Sep 2019 18:16:33 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 86F02308123B;
	Fri, 20 Sep 2019 16:16:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B2F725D721;
	Fri, 20 Sep 2019 16:16:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 33EDB1800B74;
	Fri, 20 Sep 2019 16:16:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x8KGDH2P024175 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 20 Sep 2019 12:13:17 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 860075C220; Fri, 20 Sep 2019 16:13:17 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (ovpn-112-19.phx2.redhat.com [10.3.112.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 481D45C1B5;
	Fri, 20 Sep 2019 16:13:01 +0000 (UTC)
Date: Fri, 20 Sep 2019 12:12:58 -0400
From: Richard Guy Briggs <rgb@redhat.com>
To: containers@lists.linux-foundation.org,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH ghau51/ghau40 v7 04/12] add ausearch containerid support
Message-ID: <20190920161258.4yffmfnmofdtwtdp@madcap2.tricolour.ca>
References: <1568856472-10173-1-git-send-email-rgb@redhat.com>
	<1568856472-10173-5-git-send-email-rgb@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1568856472-10173-5-git-send-email-rgb@redhat.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: linux-audit@redhat.com
Cc: nhorman@redhat.com, eparis@parisplace.org, mpatel@redhat.com
X-BeenThere: linux-audit@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux Audit Discussion <linux-audit.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-audit>,
	<mailto:linux-audit-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-audit>
List-Post: <mailto:linux-audit@redhat.com>
List-Help: <mailto:linux-audit-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-audit>,
	<mailto:linux-audit-request@redhat.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]); Fri, 20 Sep 2019 16:16:32 +0000 (UTC)

On 2019-09-18 21:27, Richard Guy Briggs wrote:
> Add support to ausearch for searching on the containerid field in
> records.

Steve, I'm expecting that you may be able to help here on ausearch.  The
problem is I've modelled this search code on expecting only one value to
be delivered in the contid= field in CONTAINER_OP and CONTAINER_ID
records.  In the case of the latter type of record, the value could
either be a CSV list or a nested list (separated by ^), so the value
stored in "s->contid" (or l->s.contid) would need to be more complex and
the check against it no longer a simple equality check but rather a
parse and check of each listed value for a match.

Do you have a way to do that already in other fields that I could use as
a current best practice, or shall I work on a method myself?

The CSV search will be necessary to support network namespace container
events and the nesting will be necessary only if the nesting feature and
reporting method are accepted.

> Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> ---
>  src/aureport-options.c |   1 +
>  src/ausearch-llist.c   |   2 +
>  src/ausearch-llist.h   |   1 +
>  src/ausearch-match.c   |   3 +
>  src/ausearch-options.c |  47 +++++++++++-
>  src/ausearch-options.h |   1 +
>  src/ausearch-parse.c   | 197 +++++++++++++++++++++++++++++++++++++++++++++++++
>  7 files changed, 251 insertions(+), 1 deletion(-)
> 
> diff --git a/src/aureport-options.c b/src/aureport-options.c
> index bd847d7d57f0..679c36c00985 100644
> --- a/src/aureport-options.c
> +++ b/src/aureport-options.c
> @@ -62,6 +62,7 @@ const char *event_vmname = NULL;
>  long long event_exit = 0;
>  int event_exit_is_set = 0;
>  int event_ppid = -1, event_session_id = -2;
> +unsigned long long int event_contid = -1;
>  int event_debug = 0, event_machine = -1;
>  
>  /* These are used by aureport */
> diff --git a/src/ausearch-llist.c b/src/ausearch-llist.c
> index ef5503c34fd9..ade727a9e102 100644
> --- a/src/ausearch-llist.c
> +++ b/src/ausearch-llist.c
> @@ -60,6 +60,7 @@ void list_create(llist *l)
>  	l->s.arch = 0;
>  	l->s.syscall = 0;
>  	l->s.session_id = -2;
> +	l->s.contid = -1;
>  	l->s.uuid = NULL;
>  	l->s.vmname = NULL;
>  	l->s.tuid = NULL;
> @@ -211,6 +212,7 @@ void list_clear(llist* l)
>  	l->s.arch = 0;
>  	l->s.syscall = 0;
>  	l->s.session_id = -2;
> +	l->s.contid = -1;
>  	free(l->s.uuid);
>  	l->s.uuid = NULL;
>  	free(l->s.vmname);
> diff --git a/src/ausearch-llist.h b/src/ausearch-llist.h
> index 64e4ee1f3694..2d1f52237ce6 100644
> --- a/src/ausearch-llist.h
> +++ b/src/ausearch-llist.h
> @@ -56,6 +56,7 @@ typedef struct
>    int arch;             // arch
>    int syscall;          // syscall
>    uint32_t session_id;  // Login session id
> +  __u64 contid;         // Container id
>    long long exit;       // Syscall exit code
>    int exit_is_set;      // Syscall exit code is valid
>    char *hostname;       // remote hostname
> diff --git a/src/ausearch-match.c b/src/ausearch-match.c
> index 61a11d30a09b..47c12581a963 100644
> --- a/src/ausearch-match.c
> +++ b/src/ausearch-match.c
> @@ -113,6 +113,9 @@ int match(llist *l)
>  				if ((event_session_id != -2) &&
>  					(event_session_id != l->s.session_id))
>  					return 0;
> +				if ((event_contid != -1) &&
> +					(event_contid != l->s.contid))
> +					return 0;
>  				if (event_exit_is_set) {
>  					if (l->s.exit_is_set == 0)
>  						return 0;
> diff --git a/src/ausearch-options.c b/src/ausearch-options.c
> index eb483e670957..609718657775 100644
> --- a/src/ausearch-options.c
> +++ b/src/ausearch-options.c
> @@ -60,6 +60,7 @@ int event_syscall = -1, event_machine = -1;
>  int event_ua = 0, event_ga = 0, event_se = 0;
>  int just_one = 0;
>  uint32_t event_session_id = -2;
> +unsigned long long int event_contid = -1;
>  long long event_exit = 0;
>  int event_exit_is_set = 0;
>  int line_buffered = 0;
> @@ -88,7 +89,7 @@ struct nv_pair {
>  
>  enum { S_EVENT, S_COMM, S_FILENAME, S_ALL_GID, S_EFF_GID, S_GID, S_HELP,
>  S_HOSTNAME, S_INTERP, S_INFILE, S_MESSAGE_TYPE, S_PID, S_SYSCALL, S_OSUCCESS,
> -S_TIME_END, S_TIME_START, S_TERMINAL, S_ALL_UID, S_EFF_UID, S_UID, S_LOGINID,
> +S_TIME_END, S_TIME_START, S_TERMINAL, S_ALL_UID, S_EFF_UID, S_UID, S_LOGINID, S_CONTID,
>  S_VERSION, S_EXACT_MATCH, S_EXECUTABLE, S_CONTEXT, S_SUBJECT, S_OBJECT,
>  S_PPID, S_KEY, S_RAW, S_NODE, S_IN_LOGS, S_JUST_ONE, S_SESSION, S_EXIT,
>  S_LINEBUFFERED, S_UUID, S_VMNAME, S_DEBUG, S_CHECKPOINT, S_ARCH, S_FORMAT,
> @@ -100,6 +101,7 @@ static struct nv_pair optiontab[] = {
>  	{ S_EVENT, "--event" },
>  	{ S_COMM, "-c" },
>  	{ S_COMM, "--comm" },
> +	{ S_CONTID, "--contid" },
>  	{ S_CHECKPOINT, "--checkpoint" },
>  	{ S_DEBUG, "--debug" },
>  	{ S_EXIT, "-e" },
> @@ -197,6 +199,7 @@ static void usage(void)
>  	"\t-a,--event <Audit event id>\tsearch based on audit event id\n"
>  	"\t--arch <CPU>\t\t\tsearch based on the CPU architecture\n"
>  	"\t-c,--comm  <Comm name>\t\tsearch based on command line name\n"
> +	"\t--contid <audit container id>\tsearch based on the task's audit container id\n"
>  	"\t--checkpoint <checkpoint file>\tsearch from last complete event\n"
>  	"\t--debug\t\t\tWrite malformed events that are skipped to stderr\n"
>  	"\t-e,--exit  <Exit code or errno>\tsearch based on syscall exit code\n"
> @@ -1182,6 +1185,48 @@ int check_params(int count, char *vars[])
>  			}
>  			c++;
>  			break;
> +		case S_CONTID:
> +			if (!optarg) {
> +				if ((c+1 < count) && vars[c+1])
> +					optarg = vars[c+1];
> +				else {
> +					fprintf(stderr,
> +						"Argument is required for %s\n",
> +						vars[c]);
> +					retval = -1;
> +					break;
> +				}
> +			}
> +			{
> +			size_t len = strlen(optarg);
> +			if (isdigit(optarg[0])) {
> +				errno = 0;
> +				event_contid = strtoull(optarg,NULL,0);
> +				if (errno) {
> +					fprintf(stderr, 
> +			"Numeric container ID conversion error (%s) for %s\n",
> +						strerror(errno), optarg);
> +					retval = -1;
> +				}
> +			} else if (len >= 2 && *(optarg)=='-' &&
> +					(isdigit(optarg[1]))) {
> +				errno = 0;
> +				event_contid = strtoll(optarg, NULL, 0);
> +				if (errno) {
> +					retval = -1;
> +					fprintf(stderr, "Error converting %s\n",
> +						optarg);
> +				}
> +			} else {
> +				fprintf(stderr, 
> +			"Container ID is non-numeric and unknown (%s)\n",
> +						optarg);
> +				retval = -1;
> +				break;
> +			}
> +			}
> +			c++;
> +			break;
>  		case S_UUID:
>  			if (!optarg) {
>  				fprintf(stderr,
> diff --git a/src/ausearch-options.h b/src/ausearch-options.h
> index 1372762b4b3e..c03256e36495 100644
> --- a/src/ausearch-options.h
> +++ b/src/ausearch-options.h
> @@ -40,6 +40,7 @@ extern int line_buffered;
>  extern int event_debug;
>  extern pid_t event_ppid;
>  extern uint32_t event_session_id;
> +extern unsigned long long int event_contid;
>  extern ilist *event_type;
>  
>  /* Data type to govern output format */
> diff --git a/src/ausearch-parse.c b/src/ausearch-parse.c
> index 497306dde070..4d48d59caa0f 100644
> --- a/src/ausearch-parse.c
> +++ b/src/ausearch-parse.c
> @@ -52,6 +52,8 @@ static int parse_path(const lnode *n, search_items *s);
>  static int parse_user(const lnode *n, search_items *s, anode *avc);
>  static int parse_obj(const lnode *n, search_items *s);
>  static int parse_login(const lnode *n, search_items *s);
> +static int parse_container_op(const lnode *n, search_items *s);
> +static int parse_container_id(const lnode *n, search_items *s);
>  static int parse_daemon1(const lnode *n, search_items *s);
>  static int parse_daemon2(const lnode *n, search_items *s);
>  static int parse_sockaddr(const lnode *n, search_items *s);
> @@ -113,6 +115,9 @@ int extract_search_items(llist *l)
>  			case AUDIT_LOGIN:
>  				ret = parse_login(n, s);
>  				break;
> +			case AUDIT_CONTAINER_OP:
> +				ret = parse_container_op(n, s);
> +				break;
>  			case AUDIT_IPC:
>  			case AUDIT_OBJ_PID:
>  				ret = parse_obj(n, s);
> @@ -179,6 +184,9 @@ int extract_search_items(llist *l)
>  			case AUDIT_TTY:
>  				ret = parse_tty(n, s);
>  				break;
> +			case AUDIT_CONTAINER_ID:
> +				ret = parse_container_id(n, s);
> +				break;
>  			default:
>  				if (event_debug)
>  					fprintf(stderr,
> @@ -1444,6 +1452,195 @@ static int parse_login(const lnode *n, search_items *s)
>  	return 0;
>  }
>  
> +static int parse_container_op(const lnode *n, search_items *s)
> +{
> +	char *ptr, *str, *term = n->message;
> +
> +	// skip op
> +	// skip opid
> +	// get contid
> +	if (event_contid != -1) {
> +		str = strstr(term, "contid=");
> +		if (str == NULL)
> +			return 45;
> +		ptr = str + 7;
> +		term = strchr(ptr, ' ');
> +		if (term == NULL)
> +			return 46;
> +		*term = 0;
> +		errno = 0;
> +		s->contid = strtoull(ptr, NULL, 10);
> +		if (errno)
> +			return 47;
> +		*term = ' ';
> +	}
> +	// skip old-contid
> +	// get pid
> +	if (event_pid != -1) {
> +		str = strstr(term, "pid=");
> +		if (str == NULL)
> +			return 48;
> +		ptr = str + 4;
> +		term = strchr(ptr, ' ');
> +		if (term == NULL)
> +			return 49;
> +		*term = 0;
> +		errno = 0;
> +		s->pid = strtoul(ptr, NULL, 10);
> +		if (errno)
> +			return 50;
> +		*term = ' ';
> +	}
> +	// get loginuid
> +	if (event_loginuid != -2 || event_tauid) {
> +		str = strstr(term, "auid=");
> +		if (str == NULL) {
> +			return 51;
> +		} else
> +			ptr = str + 5;
> +		term = strchr(ptr, ' ');
> +		if (term == NULL)
> +			return 52;
> +		*term = 0;
> +		errno = 0;
> +		s->loginuid = strtoul(ptr, NULL, 10);
> +		if (errno)
> +			return 53;
> +		*term = ' ';
> +		s->tauid = lookup_uid("auid", s->loginuid);
> +	}
> +	// get uid
> +	if (event_uid != -1 || event_tuid) {
> +		str = strstr(term, "uid=");
> +		if (str == NULL)
> +			return 54;
> +		ptr = str + 4;
> +		term = strchr(ptr, ' ');
> +		if (term == NULL)
> +			return 55;
> +		*term = 0;
> +		errno = 0;
> +		s->uid = strtoul(ptr, NULL, 10);
> +		if (errno)
> +			return 56;
> +		*term = ' ';
> +		s->tuid = lookup_uid("uid", s->uid);
> +	}
> +	// skip tty
> +	// ses
> +	if (event_session_id != -2 ) {
> +		str = strstr(term, "ses=");
> +		if (str == NULL)
> +			return 57;
> +		else
> +			ptr = str + 4;
> +		term = strchr(ptr, ' ');
> +		if (term == NULL)
> +			return 58;
> +		*term = 0;
> +		errno = 0;
> +		s->session_id = strtoul(ptr, NULL, 10);
> +		if (errno)
> +			return 59;
> +		*term = ' ';
> +	}
> +	// get subj
> +	if (event_subject) {
> +		str = strstr(term, "subj=");
> +		if (str == NULL)
> +			return 60;
> +		ptr = str + 5;
> +		term = strchr(ptr, ' ');
> +		if (term == NULL)
> +			return 61;
> +		*term = 0;
> +		if (audit_avc_init(s) == 0) {
> +			anode an;
> +
> +			anode_init(&an);
> +			an.scontext = strdup(str);
> +			alist_append(s->avc, &an);
> +			*term = ' ';
> +		} else
> +			return 62;
> +		*term = ' ';
> +	}
> +	// get comm
> +	if (event_comm) {
> +		str = strstr(ptr, "comm=");
> +		if (str == NULL)
> +			return 63;
> +		str += 5;
> +		if (*str == '"') {
> +			str++;
> +			term = strchr(str, '"');
> +			if (term == NULL)
> +				return 64;
> +			*term = 0;
> +			s->comm = strdup(str);
> +			*term = '"';
> +		} else 
> +			s->comm = unescape(str);
> +	}
> +	// get exe
> +	if (event_exe) {
> +		str = strstr(term, "exe=");
> +		if (str == NULL)
> +			return 65;
> +		str += 4;
> +		if (*str == '"') {
> +			str++;
> +			term = strchr(str, '"');
> +			if (term == NULL)
> +				return 66;
> +			*term = 0;
> +			s->exe = strdup(str);
> +			*term = '"';
> +		} else 
> +			s->exe = unescape(str);
> +	}
> +	// success
> +	if (event_success != S_UNSET) {
> +		str = strstr(term, "res=");
> +		if (str == NULL)
> +			return 67;
> +		ptr = str + 4;
> +		term = strchr(ptr, ' ');
> +		if (term)
> +			return 68;
> +		*term = 0;
> +		errno = 0;
> +		s->success = strtoul(ptr, NULL, 10);
> +		if (errno)
> +			return 69;
> +		*term = ' ';
> +	}
> +	return 0;
> +}
> +
> +static int parse_container_id(const lnode *n, search_items *s)
> +{
> +	char *ptr, *str, *term = n->message;
> +
> +	// get contid
> +	if (event_contid != -1) {
> +		str = strstr(term, "contid=");
> +		if (str == NULL)
> +			return 70;
> +		ptr = str + 7;
> +		term = strchr(ptr, ' ');
> +		if (term == NULL)
> +			return 71;
> +		*term = 0;
> +		errno = 0;
> +		s->contid = strtoull(ptr, NULL, 10);
> +		if (errno)
> +			return 72;
> +		*term = ' ';
> +	}
> +	return 0;
> +}
> +
>  static int parse_daemon1(const lnode *n, search_items *s)
>  {
>  	char *ptr, *str, *term, saved, *mptr;
> -- 
> 1.8.3.1
> 

- RGB

--
Richard Guy Briggs <rgb@redhat.com>
Sr. S/W Engineer, Kernel Security, Base Operating Systems
Remote, Ottawa, Red Hat Canada
IRC: rgb, SunRaycer
Voice: +1.647.777.2635, Internal: (81) 32635

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
