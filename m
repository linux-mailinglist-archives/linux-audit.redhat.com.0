Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 846EE2324FF
	for <lists+linux-audit@lfdr.de>; Wed, 29 Jul 2020 21:01:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1596049272;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=bt6Cse8ZDqc7ZcuAqWNm7P9mmeaorqAKIfBr4oUpJR8=;
	b=bPH4LygZWEjGfIPoD5nBT4dk8vTI09p1Jd8t1lpDLGZWRjYWAsQbW+R4XGKeLbbgBdtEcG
	J2NnBno7kkDMMWkVZTnSLhZWJzcrFKFw7I2H6KV947DZiAhoy60V77Rq+NSFBqwryqDyOx
	3Y+i+XaFev2bpJuPUE1RTqJZa9ZEeX0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-463-zGPvclgsNAifoTVXcaNmCQ-1; Wed, 29 Jul 2020 15:01:09 -0400
X-MC-Unique: zGPvclgsNAifoTVXcaNmCQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 41DD859;
	Wed, 29 Jul 2020 19:01:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E512610001B3;
	Wed, 29 Jul 2020 19:00:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 17B8E95A68;
	Wed, 29 Jul 2020 19:00:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06TJ0h6W030574 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 29 Jul 2020 15:00:43 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 94E4A78483; Wed, 29 Jul 2020 19:00:43 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (unknown [10.10.110.3])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6AAD987E1A;
	Wed, 29 Jul 2020 19:00:28 +0000 (UTC)
Date: Wed, 29 Jul 2020 15:00:25 -0400
From: Richard Guy Briggs <rgb@redhat.com>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH ghak90 V9 06/13] audit: add contid support for signalling
	the audit daemon
Message-ID: <20200729190025.mueangq3os3r7ew6@madcap2.tricolour.ca>
References: <cover.1593198710.git.rgb@redhat.com>
	<f01f38dbb3190191e5914874322342700aecb9e1.1593198710.git.rgb@redhat.com>
	<CAHC9VhRPm4=_dVkZCu9iD5u5ixJOUnGNZ2wM9CL4kWwqv3GRnA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHC9VhRPm4=_dVkZCu9iD5u5ixJOUnGNZ2wM9CL4kWwqv3GRnA@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: linux-audit@redhat.com
Cc: nhorman@tuxdriver.com, linux-api@vger.kernel.org,
	containers@lists.linux-foundation.org,
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 2020-07-05 11:10, Paul Moore wrote:
> On Sat, Jun 27, 2020 at 9:22 AM Richard Guy Briggs <rgb@redhat.com> wrote:
> >
> > Add audit container identifier support to the action of signalling the
> > audit daemon.
> >
> > Since this would need to add an element to the audit_sig_info struct,
> > a new record type AUDIT_SIGNAL_INFO2 was created with a new
> > audit_sig_info2 struct.  Corresponding support is required in the
> > userspace code to reflect the new record request and reply type.
> > An older userspace won't break since it won't know to request this
> > record type.
> >
> > Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> > ---
> >  include/linux/audit.h       |  8 ++++
> >  include/uapi/linux/audit.h  |  1 +
> >  kernel/audit.c              | 95 ++++++++++++++++++++++++++++++++++++++++++++-
> >  security/selinux/nlmsgtab.c |  1 +
> >  4 files changed, 104 insertions(+), 1 deletion(-)
> >
> > diff --git a/include/linux/audit.h b/include/linux/audit.h
> > index 5eeba0efffc2..89cf7c66abe6 100644
> > --- a/include/linux/audit.h
> > +++ b/include/linux/audit.h
> > @@ -22,6 +22,13 @@ struct audit_sig_info {
> >         char            ctx[];
> >  };
> >
> > +struct audit_sig_info2 {
> > +       uid_t           uid;
> > +       pid_t           pid;
> > +       u32             cid_len;
> > +       char            data[];
> > +};
> > +
> >  struct audit_buffer;
> >  struct audit_context;
> >  struct inode;
> > @@ -105,6 +112,7 @@ struct audit_contobj {
> >         u64                     id;
> >         struct task_struct      *owner;
> >         refcount_t              refcount;
> > +       refcount_t              sigflag;
> >         struct rcu_head         rcu;
> >  };
> 
> It seems like we need some protection in audit_set_contid() so that we
> don't allow reuse of an audit container ID when "refcount == 0 &&
> sigflag != 0", yes?

We have it, see -ESHUTDOWN below.

> > diff --git a/include/uapi/linux/audit.h b/include/uapi/linux/audit.h
> > index fd98460c983f..a56ad77069b9 100644
> > --- a/include/uapi/linux/audit.h
> > +++ b/include/uapi/linux/audit.h
> > @@ -72,6 +72,7 @@
> >  #define AUDIT_SET_FEATURE      1018    /* Turn an audit feature on or off */
> >  #define AUDIT_GET_FEATURE      1019    /* Get which features are enabled */
> >  #define AUDIT_CONTAINER_OP     1020    /* Define the container id and info */
> > +#define AUDIT_SIGNAL_INFO2     1021    /* Get info auditd signal sender */
> >
> >  #define AUDIT_FIRST_USER_MSG   1100    /* Userspace messages mostly uninteresting to kernel */
> >  #define AUDIT_USER_AVC         1107    /* We filter this differently */
> > diff --git a/kernel/audit.c b/kernel/audit.c
> > index a09f8f661234..54dd2cb69402 100644
> > --- a/kernel/audit.c
> > +++ b/kernel/audit.c
> > @@ -126,6 +126,8 @@ struct auditd_connection {
> >  kuid_t         audit_sig_uid = INVALID_UID;
> >  pid_t          audit_sig_pid = -1;
> >  u32            audit_sig_sid = 0;
> > +static struct audit_contobj *audit_sig_cid;
> > +static struct task_struct *audit_sig_atsk;
> 
> This looks like a typo, or did you mean "atsk" for some reason?

No, I meant atsk to refer specifically to the audit daemon task and not
any other random one that is doing the signalling.  I can change it is
there is a strong objection.

> >  /* Records can be lost in several ways:
> >     0) [suppressed in audit_alloc]
> > @@ -239,7 +241,33 @@ void _audit_contobj_put(struct audit_contobj *cont)
> >  {
> >         if (!cont)
> >                 return;
> > -       if (refcount_dec_and_test(&cont->refcount)) {
> > +       if (refcount_dec_and_test(&cont->refcount) && !refcount_read(&cont->sigflag)) {
> > +               put_task_struct(cont->owner);
> > +               list_del_rcu(&cont->list);
> > +               kfree_rcu(cont, rcu);
> > +       }
> > +}
> 
> It seems like it might be a good idea to modify the corresponding
> _get() to WARN on the reuse of audit container objects where refcount
> is zero, similar to the comment I made above.  What do you think?

This will never happen.  See -ESHUTDOWN below.

> > +/* rcu_read_lock must be held by caller unless new */
> > +static struct audit_contobj *_audit_contobj_get_sig(struct task_struct *tsk)
> > +{
> > +       struct audit_contobj *cont;
> > +
> > +       if (!tsk->audit)
> > +               return NULL;
> > +       cont = tsk->audit->cont;
> > +       if (cont)
> > +               refcount_set(&cont->sigflag, 1);
> > +       return cont;
> > +}
> 
> If you are going to use a refcount and call this a "get" function you
> might as well make it do an increment and not just a set(1).  It a bit
> silly with just one auditd per system, but I suppose it will make more
> sense when we have multiple audit daemons.  In a related comment, you
> probably want to rename "sigflag" to "sigcount" or similar.

I preferred that previously.  I'll go back to that.

> In summary, it's either a reference that supports multiple gets/puts
> or it's a flag with just an on/off; it shouldn't attempt to straddle
> both, that's both confusing and fragile.

Agreed.  I'll switch it back to refcount.

> > +/* rcu_read_lock must be held by caller */
> > +static void _audit_contobj_put_sig(struct audit_contobj *cont)
> > +{
> > +       if (!cont)
> > +               return;
> > +       refcount_set(&cont->sigflag, 0);
> > +       if (!refcount_read(&cont->refcount)) {
> >                 put_task_struct(cont->owner);
> >                 list_del_rcu(&cont->list);
> >                 kfree_rcu(cont, rcu);
> > @@ -309,6 +337,13 @@ void audit_free(struct task_struct *tsk)
> >         info = tsk->audit;
> >         tsk->audit = NULL;
> >         kmem_cache_free(audit_task_cache, info);
> > +       rcu_read_lock();
> > +       if (audit_sig_atsk == tsk) {
> > +               _audit_contobj_put_sig(audit_sig_cid);
> > +               audit_sig_cid = NULL;
> > +               audit_sig_atsk = NULL;
> > +       }
> > +       rcu_read_unlock();
> >  }
> >
> >  /**
> > @@ -1132,6 +1167,7 @@ static int audit_netlink_ok(struct sk_buff *skb, u16 msg_type)
> >         case AUDIT_ADD_RULE:
> >         case AUDIT_DEL_RULE:
> >         case AUDIT_SIGNAL_INFO:
> > +       case AUDIT_SIGNAL_INFO2:
> >         case AUDIT_TTY_GET:
> >         case AUDIT_TTY_SET:
> >         case AUDIT_TRIM:
> > @@ -1294,6 +1330,7 @@ static int audit_receive_msg(struct sk_buff *skb, struct nlmsghdr *nlh)
> >         struct audit_buffer     *ab;
> >         u16                     msg_type = nlh->nlmsg_type;
> >         struct audit_sig_info   *sig_data;
> > +       struct audit_sig_info2  *sig_data2;
> >         char                    *ctx = NULL;
> >         u32                     len;
> >
> > @@ -1559,6 +1596,52 @@ static int audit_receive_msg(struct sk_buff *skb, struct nlmsghdr *nlh)
> >                                  sig_data, sizeof(*sig_data) + len);
> >                 kfree(sig_data);
> >                 break;
> > +       case AUDIT_SIGNAL_INFO2: {
> > +               unsigned int contidstrlen = 0;
> > +
> > +               len = 0;
> > +               if (audit_sig_sid) {
> > +                       err = security_secid_to_secctx(audit_sig_sid, &ctx,
> > +                                                      &len);
> > +                       if (err)
> > +                               return err;
> > +               }
> > +               if (audit_sig_cid) {
> > +                       contidstr = kmalloc(21, GFP_KERNEL);
> > +                       if (!contidstr) {
> > +                               if (audit_sig_sid)
> > +                                       security_release_secctx(ctx, len);
> > +                               return -ENOMEM;
> > +                       }
> > +                       contidstrlen = scnprintf(contidstr, 20, "%llu", audit_sig_cid->id);
> > +               }
> > +               sig_data2 = kmalloc(sizeof(*sig_data2) + contidstrlen + len, GFP_KERNEL);
> > +               if (!sig_data2) {
> > +                       if (audit_sig_sid)
> > +                               security_release_secctx(ctx, len);
> > +                       kfree(contidstr);
> > +                       return -ENOMEM;
> > +               }
> > +               sig_data2->uid = from_kuid(&init_user_ns, audit_sig_uid);
> > +               sig_data2->pid = audit_sig_pid;
> > +               if (audit_sig_cid) {
> > +                       memcpy(sig_data2->data, contidstr, contidstrlen);
> > +                       sig_data2->cid_len = contidstrlen;
> > +                       kfree(contidstr);
> > +               }
> > +               if (audit_sig_sid) {
> > +                       memcpy(sig_data2->data + contidstrlen, ctx, len);
> > +                       security_release_secctx(ctx, len);
> > +               }
> > +               rcu_read_lock();
> > +               _audit_contobj_put_sig(audit_sig_cid);
> > +               rcu_read_unlock();
> 
> We probably want to drop the reference in the legacy/AUDIT_SIGNAL_INFO
> case too, right?

Yes, thank you for catching that.  This would be the case of an old
userspace and we don't want that kernel mem/contid leak.

> > +               audit_sig_cid = NULL;
> > +               audit_send_reply(skb, seq, AUDIT_SIGNAL_INFO2, 0, 0,
> > +                                sig_data2, sizeof(*sig_data2) + contidstrlen + len);
> > +               kfree(sig_data2);
> > +               break;
> > +       }
> >         case AUDIT_TTY_GET: {
> >                 struct audit_tty_status s;
> >                 unsigned int t;
> > @@ -2470,6 +2553,11 @@ int audit_signal_info(int sig, struct task_struct *t)
> >                 else
> >                         audit_sig_uid = uid;
> >                 security_task_getsecid(current, &audit_sig_sid);
> > +               rcu_read_lock();
> > +               _audit_contobj_put_sig(audit_sig_cid);
> > +               audit_sig_cid = _audit_contobj_get_sig(current);
> > +               rcu_read_unlock();
> > +               audit_sig_atsk = t;
> >         }
> >
> >         return audit_signal_info_syscall(t);
> > @@ -2532,6 +2620,11 @@ int audit_set_contid(struct task_struct *task, u64 contid)
> >                         if (cont->id == contid) {
> >                                 /* task injection to existing container */
> >                                 if (current == cont->owner) {
> > +                                       if (!refcount_read(&cont->refcount)) {
> > +                                               rc = -ESHUTDOWN;
> 
> Reuse -ENOTUNIQ; I'm not overly excited about providing a lot of
> detail here as these are global system objects.  If you must have a
> different errno (and I would prefer you didn't), use something like
> -EBUSY.

I don't understand the issue of "global system objects" since the only
time this error would be issued is if its own contid were being reused
but it hadn't cleaned up its own references yet by either issuing an
AUDIT_SIGNAL_INFO* request or the targetted audit daemon hadn't cleaned
up yet.  EBUSY could be confused with already having spawned threads or
children, and ENOTUNIQ could indicate that another orchestrator/engine
had stolen its desired contid after we released it and wanted to reuse
it.  This gets me thinking about making reservations for preferred
contids that are otherwise unavailable and making callbacks to indicate
when they become available, but that seems undesirably complex right
now.

> > +                                               spin_unlock(&audit_contobj_list_lock);
> > +                                               goto conterror;
> > +                                       }
> >                                         _audit_contobj_hold(cont);
> >                                         newcont = cont;
> >                                 } else {
> > diff --git a/security/selinux/nlmsgtab.c b/security/selinux/nlmsgtab.c
> > index b69231918686..8303bb7a63d0 100644
> > --- a/security/selinux/nlmsgtab.c
> > +++ b/security/selinux/nlmsgtab.c
> > @@ -137,6 +137,7 @@ struct nlmsg_perm {
> >         { AUDIT_DEL_RULE,       NETLINK_AUDIT_SOCKET__NLMSG_WRITE    },
> >         { AUDIT_USER,           NETLINK_AUDIT_SOCKET__NLMSG_RELAY    },
> >         { AUDIT_SIGNAL_INFO,    NETLINK_AUDIT_SOCKET__NLMSG_READ     },
> > +       { AUDIT_SIGNAL_INFO2,   NETLINK_AUDIT_SOCKET__NLMSG_READ     },
> >         { AUDIT_TRIM,           NETLINK_AUDIT_SOCKET__NLMSG_WRITE    },
> >         { AUDIT_MAKE_EQUIV,     NETLINK_AUDIT_SOCKET__NLMSG_WRITE    },
> >         { AUDIT_TTY_GET,        NETLINK_AUDIT_SOCKET__NLMSG_READ     },
> 
> paul moore

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

