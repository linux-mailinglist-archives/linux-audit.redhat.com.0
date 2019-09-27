Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C7AC05C5
	for <lists+linux-audit@lfdr.de>; Fri, 27 Sep 2019 14:54:11 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 46F3B1DB0;
	Fri, 27 Sep 2019 12:54:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 35B511C92B;
	Fri, 27 Sep 2019 12:54:07 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EA7A04EE69;
	Fri, 27 Sep 2019 12:54:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x8RCrNmr002677 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 27 Sep 2019 08:53:25 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1F0C9600C6; Fri, 27 Sep 2019 12:53:23 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx30.extmail.prod.ext.phx2.redhat.com
	[10.5.110.71])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8D75D6017E;
	Fri, 27 Sep 2019 12:53:09 +0000 (UTC)
Received: from smtp.tuxdriver.com (charlotte.tuxdriver.com [70.61.120.58])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 06C951DB0;
	Fri, 27 Sep 2019 12:52:01 +0000 (UTC)
Received: from cpe-2606-a000-111b-43ee-0-0-0-115f.dyn6.twc.com
	([2606:a000:111b:43ee::115f] helo=localhost)
	by smtp.tuxdriver.com with esmtpsa (TLSv1:AES256-SHA:256) (Exim 4.63)
	(envelope-from <nhorman@tuxdriver.com>)
	id 1iDpiu-0003PC-9y; Fri, 27 Sep 2019 08:51:55 -0400
Date: Fri, 27 Sep 2019 08:51:42 -0400
From: Neil Horman <nhorman@tuxdriver.com>
To: Richard Guy Briggs <rgb@redhat.com>
Subject: Re: [PATCH ghak90 V7 06/21] audit: contid limit of 32k imposed to
	avoid DoS
Message-ID: <20190927125142.GA25764@hmswarspite.think-freely.org>
References: <cover.1568834524.git.rgb@redhat.com>
	<230e91cd3e50a3d8015daac135c24c4c58cf0a21.1568834524.git.rgb@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <230e91cd3e50a3d8015daac135c24c4c58cf0a21.1568834524.git.rgb@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Spam-Status: No
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.6.2 (mx1.redhat.com
	[10.5.110.71]); Fri, 27 Sep 2019 12:52:53 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.71]);
	Fri, 27 Sep 2019 12:52:53 +0000 (UTC) for IP:'70.61.120.58'
	DOMAIN:'charlotte.tuxdriver.com' HELO:'smtp.tuxdriver.com'
	FROM:'nhorman@tuxdriver.com' RCPT:''
X-RedHat-Spam-Score: 0.002  (RCVD_IN_DNSWL_NONE, SPF_HELO_NONE,
	SPF_NONE) 70.61.120.58 charlotte.tuxdriver.com
	70.61.120.58 charlotte.tuxdriver.com <nhorman@tuxdriver.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.71
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.71]); Fri, 27 Sep 2019 12:54:10 +0000 (UTC)

On Wed, Sep 18, 2019 at 09:22:23PM -0400, Richard Guy Briggs wrote:
> Set an arbitrary limit on the number of audit container identifiers to
> limit abuse.
> 
> Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> ---
>  kernel/audit.c | 8 ++++++++
>  kernel/audit.h | 4 ++++
>  2 files changed, 12 insertions(+)
> 
> diff --git a/kernel/audit.c b/kernel/audit.c
> index 53d13d638c63..329916534dd2 100644
> --- a/kernel/audit.c
> +++ b/kernel/audit.c
> @@ -139,6 +139,7 @@ struct audit_net {
>  struct list_head audit_inode_hash[AUDIT_INODE_BUCKETS];
>  /* Hash for contid-based rules */
>  struct list_head audit_contid_hash[AUDIT_CONTID_BUCKETS];
> +int audit_contid_count = 0;
>  
>  static struct kmem_cache *audit_buffer_cache;
>  
> @@ -2384,6 +2385,7 @@ void audit_cont_put(struct audit_cont *cont)
>  		put_task_struct(cont->owner);
>  		list_del_rcu(&cont->list);
>  		kfree_rcu(cont, rcu);
> +		audit_contid_count--;
>  	}
>  }
>  
> @@ -2456,6 +2458,11 @@ int audit_set_contid(struct task_struct *task, u64 contid)
>  					goto conterror;
>  				}
>  			}
> +		/* Set max contids */
> +		if (audit_contid_count > AUDIT_CONTID_COUNT) {
> +			rc = -ENOSPC;
> +			goto conterror;
> +		}
You should check for audit_contid_count == AUDIT_CONTID_COUNT here, no?
or at least >=, since you increment it below.  Otherwise its possible
that you will exceed it by one in the full condition.

>  		if (!newcont) {
>  			newcont = kmalloc(sizeof(struct audit_cont), GFP_ATOMIC);
>  			if (newcont) {
> @@ -2465,6 +2472,7 @@ int audit_set_contid(struct task_struct *task, u64 contid)
>  				newcont->owner = current;
>  				refcount_set(&newcont->refcount, 1);
>  				list_add_rcu(&newcont->list, &audit_contid_hash[h]);
> +				audit_contid_count++;
>  			} else {
>  				rc = -ENOMEM;
>  				goto conterror;
> diff --git a/kernel/audit.h b/kernel/audit.h
> index 162de8366b32..543f1334ba47 100644
> --- a/kernel/audit.h
> +++ b/kernel/audit.h
> @@ -219,6 +219,10 @@ static inline int audit_hash_contid(u64 contid)
>  	return (contid & (AUDIT_CONTID_BUCKETS-1));
>  }
>  
> +extern int audit_contid_count;
> +
> +#define AUDIT_CONTID_COUNT	1 << 16
> +
Just to ask the question, since it wasn't clear in the changelog, what
abuse are you avoiding here?  Ostensibly you should be able to create as
many container ids as you have space for, and the simple creation of
container ids doesn't seem like the resource strain I would be concerned
about here, given that an orchestrator can still create as many
containers as the system will otherwise allow, which will consume
significantly more ram/disk/etc.

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
