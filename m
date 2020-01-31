Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 99B2714EEC5
	for <lists+linux-audit@lfdr.de>; Fri, 31 Jan 2020 15:50:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1580482251;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=gqdDlX82q7xH5qG8+kYxDQe9NV8qxDV3aFyf/M2l2pc=;
	b=QHxYidv6mX5i01IHHLRQ6b8wICx0hnNXTYJCa/K/ynkbH2XmU/LMuUgBGrAFte9iLH2k5h
	aJpRrNF4G8BfC4peYj4BI3Tgy3rOwyt2oWlWuWfk2UyfFdB/Nn+EdLhRWqodZFlo3PoUT1
	72qvib4sWLL1F67nsysDM5x7FYtqtlM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-342-M-ysy_FHM9-dC2B8iFnkmw-1; Fri, 31 Jan 2020 09:50:48 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 04B201088395;
	Fri, 31 Jan 2020 14:50:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4E3C560BE1;
	Fri, 31 Jan 2020 14:50:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id ABB4618034E9;
	Fri, 31 Jan 2020 14:50:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00VEoKVX020914 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 31 Jan 2020 09:50:21 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id EC2BF5C6DC; Fri, 31 Jan 2020 14:50:20 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-117-67.phx2.redhat.com [10.3.117.67])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B23C55C54A;
	Fri, 31 Jan 2020 14:50:09 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH ghak90 V8 13/16] audit: track container nesting
Date: Fri, 31 Jan 2020 09:50:08 -0500
Message-ID: <5238532.OiMyN8JqPO@x2>
Organization: Red Hat
In-Reply-To: <CAHC9VhRkH=YEjAY6dJJHSp934grHnf=O4RiqLu3U8DzdVQOZkg@mail.gmail.com>
References: <cover.1577736799.git.rgb@redhat.com>
	<6452955c1e038227a5cd169f689f3fd3db27513f.1577736799.git.rgb@redhat.com>
	<CAHC9VhRkH=YEjAY6dJJHSp934grHnf=O4RiqLu3U8DzdVQOZkg@mail.gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: linux-audit@redhat.com
Cc: nhorman@tuxdriver.com, Richard Guy Briggs <rgb@redhat.com>,
	linux-api@vger.kernel.org, containers@lists.linux-foundation.org,
	LKML <linux-kernel@vger.kernel.org>, dhowells@redhat.com,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	netfilter-devel@vger.kernel.org, ebiederm@xmission.com,
	simo@redhat.com, netdev@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Eric Paris <eparis@parisplace.org>, mpatel@redhat.com,
	Serge Hallyn <serge@hallyn.com>
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
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: M-ysy_FHM9-dC2B8iFnkmw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wednesday, January 22, 2020 4:29:12 PM EST Paul Moore wrote:
> On Tue, Dec 31, 2019 at 2:51 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> > Track the parent container of a container to be able to filter and
> > report nesting.
> > 
> > Now that we have a way to track and check the parent container of a
> > container, modify the contid field format to be able to report that
> > nesting using a carrat ("^") separator to indicate nesting.  The
> > original field format was "contid=<contid>" for task-associated records
> > and "contid=<contid>[,<contid>[...]]" for network-namespace-associated
> > records.  The new field format is
> > "contid=<contid>[^<contid>[...]][,<contid>[...]]".
> 
> Let's make sure we always use a comma as a separator, even when
> recording the parent information, for example:
> "contid=<contid>[,^<contid>[...]][,<contid>[...]]"
> 
> > Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> > ---
> > 
> >  include/linux/audit.h |  1 +
> >  kernel/audit.c        | 53
> >  +++++++++++++++++++++++++++++++++++++++++++-------- kernel/audit.h     
> >    |  1 +
> >  kernel/auditfilter.c  | 17 ++++++++++++++++-
> >  kernel/auditsc.c      |  2 +-
> >  5 files changed, 64 insertions(+), 10 deletions(-)
> 
> ...
> 
> > diff --git a/kernel/audit.c b/kernel/audit.c
> > index ef8e07524c46..68be59d1a89b 100644
> > --- a/kernel/audit.c
> > +++ b/kernel/audit.c
> > 
> > @@ -492,6 +493,7 @@ void audit_switch_task_namespaces(struct nsproxy *ns,
> > struct task_struct *p)> 
> >                 audit_netns_contid_add(new->net_ns, contid);
> >  
> >  }
> > 
> > +void audit_log_contid(struct audit_buffer *ab, u64 contid);
> 
> If we need a forward declaration, might as well just move it up near
> the top of the file with the rest of the declarations.
> 
> > +void audit_log_contid(struct audit_buffer *ab, u64 contid)
> > +{
> > +       struct audit_contobj *cont = NULL, *prcont = NULL;
> > +       int h;
> 
> It seems safer to pass the audit container ID object and not the u64.
> 
> > +       if (!audit_contid_valid(contid)) {
> > +               audit_log_format(ab, "%llu", contid);
> 
> Do we really want to print (u64)-1 here?  Since this is a known
> invalid number, would "?" be a better choice?

The established pattern is that we print -1 when its unset and "?" when its 
totalling missing. So, how could this be invalid? It should be set or not. 
That is unless its totally missing just like when we do not run with selinux 
enabled and a context just doesn't exist.

-Steve


> > +               return;
> > +       }
> > +       h = audit_hash_contid(contid);
> > +       rcu_read_lock();
> > +       list_for_each_entry_rcu(cont, &audit_contid_hash[h], list)
> > +               if (cont->id == contid) {
> > +                       prcont = cont;
> 
> Why not just pull the code below into the body of this if statement?
> It all needs to be done under the RCU read lock anyway and the code
> would read much better this way.
> 
> > +                       break;
> > +               }
> > +       if (!prcont) {
> > +               audit_log_format(ab, "%llu", contid);
> > +               goto out;
> > +       }
> > +       while (prcont) {
> > +               audit_log_format(ab, "%llu", prcont->id);
> > +               prcont = prcont->parent;
> > +               if (prcont)
> > +                       audit_log_format(ab, "^");
> 
> In the interest of limiting the number of calls to audit_log_format(),
> how about something like the following:
> 
>   audit_log_format("%llu", cont);
>   iter = cont->parent;
>   while (iter) {
>     if (iter->parent)
>       audit_log_format("^%llu,", iter);
>     else
>       audit_log_format("^%llu", iter);
>     iter = iter->parent;
>   }
> 
> > +       }
> > +out:
> > +       rcu_read_unlock();
> > +}
> > +
> > 
> >  /*
> >  
> >   * audit_log_container_id - report container info
> >   * @context: task or local context for record
> 
> ...
> 
> > @@ -2705,9 +2741,10 @@ int audit_set_contid(struct task_struct *task, u64
> > contid)> 
> >         if (!ab)
> >         
> >                 return rc;
> > 
> > -       audit_log_format(ab,
> > -                        "op=set opid=%d contid=%llu old-contid=%llu",
> > -                        task_tgid_nr(task), contid, oldcontid);
> > +       audit_log_format(ab, "op=set opid=%d contid=",
> > task_tgid_nr(task)); +       audit_log_contid(ab, contid);
> > +       audit_log_format(ab, " old-contid=");
> > +       audit_log_contid(ab, oldcontid);
> 
> This is an interesting case where contid and old-contid are going to
> be largely the same, only the first (current) ID is going to be
> different; do we want to duplicate all of those IDs?
> 
> >         audit_log_end(ab);
> >         return rc;
> >  
> >  }
> > 
> > @@ -2723,9 +2760,9 @@ void audit_log_container_drop(void)
> 
> --
> paul moore
> www.paul-moore.com




--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

