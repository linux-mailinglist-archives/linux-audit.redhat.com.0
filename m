Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 08943BF546
	for <lists+linux-audit@lfdr.de>; Thu, 26 Sep 2019 16:48:53 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E147330917EF;
	Thu, 26 Sep 2019 14:48:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 73A455C226;
	Thu, 26 Sep 2019 14:48:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6CB2C24F30;
	Thu, 26 Sep 2019 14:48:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x8QEmQLT027794 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 26 Sep 2019 10:48:28 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9C02C5C221; Thu, 26 Sep 2019 14:48:26 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx27.extmail.prod.ext.phx2.redhat.com
	[10.5.110.68])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6372D5C220;
	Thu, 26 Sep 2019 14:48:10 +0000 (UTC)
Received: from smtp.tuxdriver.com (charlotte.tuxdriver.com [70.61.120.58])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4354AA44ACA;
	Thu, 26 Sep 2019 14:46:49 +0000 (UTC)
Received: from cpe-2606-a000-111b-43ee-0-0-0-115f.dyn6.twc.com
	([2606:a000:111b:43ee::115f] helo=localhost)
	by smtp.tuxdriver.com with esmtpsa (TLSv1:AES256-SHA:256) (Exim 4.63)
	(envelope-from <nhorman@tuxdriver.com>)
	id 1iDV2R-0002Jk-6y; Thu, 26 Sep 2019 10:46:42 -0400
Date: Thu, 26 Sep 2019 10:46:29 -0400
From: Neil Horman <nhorman@tuxdriver.com>
To: Richard Guy Briggs <rgb@redhat.com>
Subject: Re: [PATCH ghak90 V7 04/21] audit: convert to contid list to check
	for orch/engine ownership
Message-ID: <20190926144629.GB7235@hmswarspite.think-freely.org>
References: <cover.1568834524.git.rgb@redhat.com>
	<6fb4e270bfafef3d0477a06b0365fdcc5a5305b5.1568834524.git.rgb@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6fb4e270bfafef3d0477a06b0365fdcc5a5305b5.1568834524.git.rgb@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Spam-Status: No
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.6.2 (mx1.redhat.com
	[10.5.110.68]); Thu, 26 Sep 2019 14:48:02 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.68]);
	Thu, 26 Sep 2019 14:48:02 +0000 (UTC) for IP:'70.61.120.58'
	DOMAIN:'charlotte.tuxdriver.com' HELO:'smtp.tuxdriver.com'
	FROM:'nhorman@tuxdriver.com' RCPT:''
X-RedHat-Spam-Score: 0  (RCVD_IN_DNSWL_NONE, SPF_HELO_NONE,
	SPF_PASS) 70.61.120.58 charlotte.tuxdriver.com
	70.61.120.58 charlotte.tuxdriver.com <nhorman@tuxdriver.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.68
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: linux-audit@redhat.com
Cc: linux-api@vger.kernel.org, containers@lists.linux-foundation.org,
	LKML <linux-kernel@vger.kernel.org>, dhowells@redhat.com,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	netfilter-devel@vger.kernel.org, ebiederm@xmission.com,
	simo@redhat.com, netdev@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, eparis@parisplace.org,
	mpatel@redhat.com, serge@hallyn.com
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]); Thu, 26 Sep 2019 14:48:51 +0000 (UTC)

On Wed, Sep 18, 2019 at 09:22:21PM -0400, Richard Guy Briggs wrote:
> Store the audit container identifier in a refcounted kernel object that
> is added to the master list of audit container identifiers.  This will
> allow multiple container orchestrators/engines to work on the same
> machine without danger of inadvertantly re-using an existing identifier.
> It will also allow an orchestrator to inject a process into an existing
> container by checking if the original container owner is the one
> injecting the task.  A hash table list is used to optimize searches.
> 
> Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> ---
>  include/linux/audit.h | 26 ++++++++++++++--
>  kernel/audit.c        | 86 ++++++++++++++++++++++++++++++++++++++++++++++++---
>  kernel/audit.h        |  8 +++++
>  3 files changed, 112 insertions(+), 8 deletions(-)
> 
> diff --git a/include/linux/audit.h b/include/linux/audit.h
> index f2e3b81f2942..e317807cdd3e 100644
> --- a/include/linux/audit.h
> +++ b/include/linux/audit.h
> @@ -95,10 +95,18 @@ struct audit_ntp_data {
>  struct audit_ntp_data {};
>  #endif
>  
> +struct audit_cont {
> +	struct list_head	list;
> +	u64			id;
> +	struct task_struct	*owner;
> +	refcount_t              refcount;
> +	struct rcu_head         rcu;
> +};
> +
>  struct audit_task_info {
>  	kuid_t			loginuid;
>  	unsigned int		sessionid;
> -	u64			contid;
> +	struct audit_cont	*cont;
>  #ifdef CONFIG_AUDITSYSCALL
>  	struct audit_context	*ctx;
>  #endif
> @@ -203,11 +211,15 @@ static inline unsigned int audit_get_sessionid(struct task_struct *tsk)
>  
>  static inline u64 audit_get_contid(struct task_struct *tsk)
>  {
> -	if (!tsk->audit)
> +	if (!tsk->audit || !tsk->audit->cont)
>  		return AUDIT_CID_UNSET;
> -	return tsk->audit->contid;
> +	return tsk->audit->cont->id;
>  }
>  
> +extern struct audit_cont *audit_cont(struct task_struct *tsk);
> +
> +extern void audit_cont_put(struct audit_cont *cont);
> +
I see that you manual increment this refcount at various call sites, why
no corresponding audit_contid_hold function?

Neil

>  extern u32 audit_enabled;
>  
>  extern int audit_signal_info(int sig, struct task_struct *t);
> @@ -277,6 +289,14 @@ static inline u64 audit_get_contid(struct task_struct *tsk)
>  	return AUDIT_CID_UNSET;
>  }
>  
> +static inline struct audit_cont *audit_cont(struct task_struct *tsk)
> +{
> +	return NULL;
> +}
> +
> +static inline void audit_cont_put(struct audit_cont *cont)
> +{ }
> +
>  #define audit_enabled AUDIT_OFF
>  
>  static inline int audit_signal_info(int sig, struct task_struct *t)
> diff --git a/kernel/audit.c b/kernel/audit.c
> index a36ea57cbb61..ea0899130cc1 100644
> --- a/kernel/audit.c
> +++ b/kernel/audit.c
> @@ -137,6 +137,8 @@ struct audit_net {
>  
>  /* Hash for inode-based rules */
>  struct list_head audit_inode_hash[AUDIT_INODE_BUCKETS];
> +/* Hash for contid-based rules */
> +struct list_head audit_contid_hash[AUDIT_CONTID_BUCKETS];
>  
>  static struct kmem_cache *audit_buffer_cache;
>  
> @@ -204,6 +206,8 @@ struct audit_reply {
>  
>  static struct kmem_cache *audit_task_cache;
>  
> +static DEFINE_SPINLOCK(audit_contid_list_lock);
> +
>  void __init audit_task_init(void)
>  {
>  	audit_task_cache = kmem_cache_create("audit_task",
> @@ -231,7 +235,9 @@ int audit_alloc(struct task_struct *tsk)
>  	}
>  	info->loginuid = audit_get_loginuid(current);
>  	info->sessionid = audit_get_sessionid(current);
> -	info->contid = audit_get_contid(current);
> +	info->cont = audit_cont(current);
> +	if (info->cont)
> +		refcount_inc(&info->cont->refcount);
>  	tsk->audit = info;
>  
>  	ret = audit_alloc_syscall(tsk);
> @@ -246,7 +252,7 @@ int audit_alloc(struct task_struct *tsk)
>  struct audit_task_info init_struct_audit = {
>  	.loginuid = INVALID_UID,
>  	.sessionid = AUDIT_SID_UNSET,
> -	.contid = AUDIT_CID_UNSET,
> +	.cont = NULL,
>  #ifdef CONFIG_AUDITSYSCALL
>  	.ctx = NULL,
>  #endif
> @@ -266,6 +272,9 @@ void audit_free(struct task_struct *tsk)
>  	/* Freeing the audit_task_info struct must be performed after
>  	 * audit_log_exit() due to need for loginuid and sessionid.
>  	 */
> +	spin_lock(&audit_contid_list_lock); 
> +	audit_cont_put(tsk->audit->cont);
> +	spin_unlock(&audit_contid_list_lock); 
>  	info = tsk->audit;
>  	tsk->audit = NULL;
>  	kmem_cache_free(audit_task_cache, info);
> @@ -1657,6 +1666,9 @@ static int __init audit_init(void)
>  	for (i = 0; i < AUDIT_INODE_BUCKETS; i++)
>  		INIT_LIST_HEAD(&audit_inode_hash[i]);
>  
> +	for (i = 0; i < AUDIT_CONTID_BUCKETS; i++)
> +		INIT_LIST_HEAD(&audit_contid_hash[i]);
> +
>  	mutex_init(&audit_cmd_mutex.lock);
>  	audit_cmd_mutex.owner = NULL;
>  
> @@ -2356,6 +2368,32 @@ int audit_signal_info(int sig, struct task_struct *t)
>  	return audit_signal_info_syscall(t);
>  }
>  
> +struct audit_cont *audit_cont(struct task_struct *tsk)
> +{
> +	if (!tsk->audit || !tsk->audit->cont)
> +		return NULL;
> +	return tsk->audit->cont;
> +}
> +
> +/* audit_contid_list_lock must be held by caller */
> +void audit_cont_put(struct audit_cont *cont)
> +{
> +	if (!cont)
> +		return;
> +	if (refcount_dec_and_test(&cont->refcount)) {
> +		put_task_struct(cont->owner);
> +		list_del_rcu(&cont->list);
> +		kfree_rcu(cont, rcu);
> +	}
> +}
> +
> +static struct task_struct *audit_cont_owner(struct task_struct *tsk)
> +{
> +	if (tsk->audit && tsk->audit->cont)
> +		return tsk->audit->cont->owner;
> +	return NULL;
> +}
> +
>  /*
>   * audit_set_contid - set current task's audit contid
>   * @task: target task
> @@ -2382,9 +2420,12 @@ int audit_set_contid(struct task_struct *task, u64 contid)
>  	}
>  	oldcontid = audit_get_contid(task);
>  	read_lock(&tasklist_lock);
> -	/* Don't allow the audit containerid to be unset */
> +	/* Don't allow the contid to be unset */
>  	if (!audit_contid_valid(contid))
>  		rc = -EINVAL;
> +	/* Don't allow the contid to be set to the same value again */
> +	else if (contid == oldcontid) {
> +		rc = -EADDRINUSE;
>  	/* if we don't have caps, reject */
>  	else if (!capable(CAP_AUDIT_CONTROL))
>  		rc = -EPERM;
> @@ -2397,8 +2438,43 @@ int audit_set_contid(struct task_struct *task, u64 contid)
>  	else if (audit_contid_set(task))
>  		rc = -ECHILD;
>  	read_unlock(&tasklist_lock);
> -	if (!rc)
> -		task->audit->contid = contid;
> +	if (!rc) {
> +		struct audit_cont *oldcont = audit_cont(task);
> +		struct audit_cont *cont = NULL;
> +		struct audit_cont *newcont = NULL;
> +		int h = audit_hash_contid(contid);
> +
> +		spin_lock(&audit_contid_list_lock);
> +		list_for_each_entry_rcu(cont, &audit_contid_hash[h], list)
> +			if (cont->id == contid) {
> +				/* task injection to existing container */
> +				if (current == cont->owner) {
> +					refcount_inc(&cont->refcount);
> +					newcont = cont;
> +				} else {
> +					rc = -ENOTUNIQ;
> +					goto conterror;
> +				}
> +			}
> +		if (!newcont) {
> +			newcont = kmalloc(sizeof(struct audit_cont), GFP_ATOMIC);
> +			if (newcont) {
> +				INIT_LIST_HEAD(&newcont->list);
> +				newcont->id = contid;
> +				get_task_struct(current);
> +				newcont->owner = current;
> +				refcount_set(&newcont->refcount, 1);
> +				list_add_rcu(&newcont->list, &audit_contid_hash[h]);
> +			} else {
> +				rc = -ENOMEM;
> +				goto conterror;
> +			}
> +		}
> +		task->audit->cont = newcont;
> +		audit_cont_put(oldcont);
> +conterror:
> +		spin_unlock(&audit_contid_list_lock);
> +	}
>  	task_unlock(task);
>  
>  	if (!audit_enabled)
> diff --git a/kernel/audit.h b/kernel/audit.h
> index 16bd03b88e0d..e4a31aa92dfe 100644
> --- a/kernel/audit.h
> +++ b/kernel/audit.h
> @@ -211,6 +211,14 @@ static inline int audit_hash_ino(u32 ino)
>  	return (ino & (AUDIT_INODE_BUCKETS-1));
>  }
>  
> +#define AUDIT_CONTID_BUCKETS	32
> +extern struct list_head audit_contid_hash[AUDIT_CONTID_BUCKETS];
> +
> +static inline int audit_hash_contid(u64 contid)
> +{
> +	return (contid & (AUDIT_CONTID_BUCKETS-1));
> +}
> +
>  /* Indicates that audit should log the full pathname. */
>  #define AUDIT_NAME_FULL -1
>  
> -- 
> 1.8.3.1
> 
> 

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
