Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 3459AE714C
	for <lists+linux-audit@lfdr.de>; Mon, 28 Oct 2019 13:24:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1572265478;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=p69O373B74w8rwRmYytvprqd8n08YPobBjEqB1iKpts=;
	b=bqvc6l1htKLTOcijdsWF8o9UShNt5wZKC76fy9X99uJijQT5V77044fnyiR83144X+C+tM
	ny9bmEjEH/M08JBSs5nS5NSCaXA7OPKH31amKI3unxJSlwviXrfxhUV+e2vdqUY0UD7s2X
	GCgo46sLv6m9zjw2AQFFF6CH2CT7KeA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-67-yHQ7kaC9MlG5bxl-hgA0kw-1; Mon, 28 Oct 2019 08:24:35 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8D57D800FF1;
	Mon, 28 Oct 2019 12:24:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 60FE81001902;
	Mon, 28 Oct 2019 12:24:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5C1461809563;
	Mon, 28 Oct 2019 12:24:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9SCOBpQ019657 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 28 Oct 2019 08:24:14 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E40F0600CA; Mon, 28 Oct 2019 12:24:11 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx20.extmail.prod.ext.phx2.redhat.com
	[10.5.110.49])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D22DE600D5;
	Mon, 28 Oct 2019 12:23:51 +0000 (UTC)
Received: from smtp.tuxdriver.com (charlotte.tuxdriver.com [70.61.120.58])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 693843086258;
	Mon, 28 Oct 2019 12:21:20 +0000 (UTC)
Received: from cpe-2606-a000-111b-43ee-0-0-0-115f.dyn6.twc.com
	([2606:a000:111b:43ee::115f] helo=localhost)
	by smtp.tuxdriver.com with esmtpsa (TLSv1:AES256-SHA:256) (Exim 4.63)
	(envelope-from <nhorman@tuxdriver.com>)
	id 1iP416-0002vS-W3; Mon, 28 Oct 2019 08:21:09 -0400
Date: Mon, 28 Oct 2019 08:20:55 -0400
From: Neil Horman <nhorman@tuxdriver.com>
To: Richard Guy Briggs <rgb@redhat.com>
Subject: Re: [PATCH ghak90 V7 04/21] audit: convert to contid list to check
	for orch/engine ownership
Message-ID: <20191028122055.GA27683@hmswarspite.think-freely.org>
References: <cover.1568834524.git.rgb@redhat.com>
	<6fb4e270bfafef3d0477a06b0365fdcc5a5305b5.1568834524.git.rgb@redhat.com>
	<20190926144629.GB7235@hmswarspite.think-freely.org>
	<20191025200019.vfd66aygccpf5yoe@madcap2.tricolour.ca>
MIME-Version: 1.0
In-Reply-To: <20191025200019.vfd66aygccpf5yoe@madcap2.tricolour.ca>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Spam-Status: No
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.49]); Mon, 28 Oct 2019 12:23:21 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]);
	Mon, 28 Oct 2019 12:23:21 +0000 (UTC) for IP:'70.61.120.58'
	DOMAIN:'charlotte.tuxdriver.com' HELO:'smtp.tuxdriver.com'
	FROM:'nhorman@tuxdriver.com' RCPT:''
X-RedHat-Spam-Score: 0 (RCVD_IN_DNSWL_NONE) 70.61.120.58
	charlotte.tuxdriver.com 70.61.120.58 charlotte.tuxdriver.com
	<nhorman@tuxdriver.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.49
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
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: yHQ7kaC9MlG5bxl-hgA0kw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Fri, Oct 25, 2019 at 04:00:19PM -0400, Richard Guy Briggs wrote:
> On 2019-09-26 10:46, Neil Horman wrote:
> > On Wed, Sep 18, 2019 at 09:22:21PM -0400, Richard Guy Briggs wrote:
> > > Store the audit container identifier in a refcounted kernel object th=
at
> > > is added to the master list of audit container identifiers.  This wil=
l
> > > allow multiple container orchestrators/engines to work on the same
> > > machine without danger of inadvertantly re-using an existing identifi=
er.
> > > It will also allow an orchestrator to inject a process into an existi=
ng
> > > container by checking if the original container owner is the one
> > > injecting the task.  A hash table list is used to optimize searches.
> > >=20
> > > Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> > > ---
> > >  include/linux/audit.h | 26 ++++++++++++++--
> > >  kernel/audit.c        | 86 +++++++++++++++++++++++++++++++++++++++++=
+++++++---
> > >  kernel/audit.h        |  8 +++++
> > >  3 files changed, 112 insertions(+), 8 deletions(-)
> > >=20
> > > diff --git a/include/linux/audit.h b/include/linux/audit.h
> > > index f2e3b81f2942..e317807cdd3e 100644
> > > --- a/include/linux/audit.h
> > > +++ b/include/linux/audit.h
> > > @@ -95,10 +95,18 @@ struct audit_ntp_data {
> > >  struct audit_ntp_data {};
> > >  #endif
> > > =20
> > > +struct audit_cont {
> > > +=09struct list_head=09list;
> > > +=09u64=09=09=09id;
> > > +=09struct task_struct=09*owner;
> > > +=09refcount_t              refcount;
> > > +=09struct rcu_head         rcu;
> > > +};
> > > +
> > >  struct audit_task_info {
> > >  =09kuid_t=09=09=09loginuid;
> > >  =09unsigned int=09=09sessionid;
> > > -=09u64=09=09=09contid;
> > > +=09struct audit_cont=09*cont;
> > >  #ifdef CONFIG_AUDITSYSCALL
> > >  =09struct audit_context=09*ctx;
> > >  #endif
> > > @@ -203,11 +211,15 @@ static inline unsigned int audit_get_sessionid(=
struct task_struct *tsk)
> > > =20
> > >  static inline u64 audit_get_contid(struct task_struct *tsk)
> > >  {
> > > -=09if (!tsk->audit)
> > > +=09if (!tsk->audit || !tsk->audit->cont)
> > >  =09=09return AUDIT_CID_UNSET;
> > > -=09return tsk->audit->contid;
> > > +=09return tsk->audit->cont->id;
> > >  }
> > > =20
> > > +extern struct audit_cont *audit_cont(struct task_struct *tsk);
> > > +
> > > +extern void audit_cont_put(struct audit_cont *cont);
> > > +
> > I see that you manual increment this refcount at various call sites, wh=
y
> > no corresponding audit_contid_hold function?
>=20
> I was trying to avoid the get function due to having one site where I
> needed the pointer for later but didn't need a refcount to it so that I
> could release the refcount it if it was replaced by another cont object.
> A hold function would just contain one line that would call the
> refcount_inc().  If I did convert things over to a get function, it
> would hide some of this extra conditional code in the main calling
> function, but in one place I could just call put immediately to
> neutralize that unneeded refcount.
>=20
Ok, but this pattern:

static inline u64 __audit_contid_get(struct audit_cont *c) {
        return c->id;
}

audit_contid_get(struct audit_cont *c) {
        refcount_hold(c)
        return __audit_contid_get(c)
}

Squares that up, doesn't it?  It gives you an internal non refcount
holding version then to use.

> Would you see any issue with that extra get/put refcount that would only
> happen in the case of changing a contid in a nesting situation?
>=20
No, I personally wouldn't have an issue with it, but the above would
make it pretty readable I think

> > Neil
> >=20
> > >  extern u32 audit_enabled;
> > > =20
> > >  extern int audit_signal_info(int sig, struct task_struct *t);
> > > @@ -277,6 +289,14 @@ static inline u64 audit_get_contid(struct task_s=
truct *tsk)
> > >  =09return AUDIT_CID_UNSET;
> > >  }
> > > =20
> > > +static inline struct audit_cont *audit_cont(struct task_struct *tsk)
> > > +{
> > > +=09return NULL;
> > > +}
> > > +
> > > +static inline void audit_cont_put(struct audit_cont *cont)
> > > +{ }
> > > +
> > >  #define audit_enabled AUDIT_OFF
> > > =20
> > >  static inline int audit_signal_info(int sig, struct task_struct *t)
> > > diff --git a/kernel/audit.c b/kernel/audit.c
> > > index a36ea57cbb61..ea0899130cc1 100644
> > > --- a/kernel/audit.c
> > > +++ b/kernel/audit.c
> > > @@ -137,6 +137,8 @@ struct audit_net {
> > > =20
> > >  /* Hash for inode-based rules */
> > >  struct list_head audit_inode_hash[AUDIT_INODE_BUCKETS];
> > > +/* Hash for contid-based rules */
> > > +struct list_head audit_contid_hash[AUDIT_CONTID_BUCKETS];
> > > =20
> > >  static struct kmem_cache *audit_buffer_cache;
> > > =20
> > > @@ -204,6 +206,8 @@ struct audit_reply {
> > > =20
> > >  static struct kmem_cache *audit_task_cache;
> > > =20
> > > +static DEFINE_SPINLOCK(audit_contid_list_lock);
> > > +
> > >  void __init audit_task_init(void)
> > >  {
> > >  =09audit_task_cache =3D kmem_cache_create("audit_task",
> > > @@ -231,7 +235,9 @@ int audit_alloc(struct task_struct *tsk)
> > >  =09}
> > >  =09info->loginuid =3D audit_get_loginuid(current);
> > >  =09info->sessionid =3D audit_get_sessionid(current);
> > > -=09info->contid =3D audit_get_contid(current);
> > > +=09info->cont =3D audit_cont(current);
> > > +=09if (info->cont)
> > > +=09=09refcount_inc(&info->cont->refcount);
> > >  =09tsk->audit =3D info;
> > > =20
> > >  =09ret =3D audit_alloc_syscall(tsk);
> > > @@ -246,7 +252,7 @@ int audit_alloc(struct task_struct *tsk)
> > >  struct audit_task_info init_struct_audit =3D {
> > >  =09.loginuid =3D INVALID_UID,
> > >  =09.sessionid =3D AUDIT_SID_UNSET,
> > > -=09.contid =3D AUDIT_CID_UNSET,
> > > +=09.cont =3D NULL,
> > >  #ifdef CONFIG_AUDITSYSCALL
> > >  =09.ctx =3D NULL,
> > >  #endif
> > > @@ -266,6 +272,9 @@ void audit_free(struct task_struct *tsk)
> > >  =09/* Freeing the audit_task_info struct must be performed after
> > >  =09 * audit_log_exit() due to need for loginuid and sessionid.
> > >  =09 */
> > > +=09spin_lock(&audit_contid_list_lock);=20
> > > +=09audit_cont_put(tsk->audit->cont);
> > > +=09spin_unlock(&audit_contid_list_lock);=20
> > >  =09info =3D tsk->audit;
> > >  =09tsk->audit =3D NULL;
> > >  =09kmem_cache_free(audit_task_cache, info);
> > > @@ -1657,6 +1666,9 @@ static int __init audit_init(void)
> > >  =09for (i =3D 0; i < AUDIT_INODE_BUCKETS; i++)
> > >  =09=09INIT_LIST_HEAD(&audit_inode_hash[i]);
> > > =20
> > > +=09for (i =3D 0; i < AUDIT_CONTID_BUCKETS; i++)
> > > +=09=09INIT_LIST_HEAD(&audit_contid_hash[i]);
> > > +
> > >  =09mutex_init(&audit_cmd_mutex.lock);
> > >  =09audit_cmd_mutex.owner =3D NULL;
> > > =20
> > > @@ -2356,6 +2368,32 @@ int audit_signal_info(int sig, struct task_str=
uct *t)
> > >  =09return audit_signal_info_syscall(t);
> > >  }
> > > =20
> > > +struct audit_cont *audit_cont(struct task_struct *tsk)
> > > +{
> > > +=09if (!tsk->audit || !tsk->audit->cont)
> > > +=09=09return NULL;
> > > +=09return tsk->audit->cont;
> > > +}
> > > +
> > > +/* audit_contid_list_lock must be held by caller */
> > > +void audit_cont_put(struct audit_cont *cont)
> > > +{
> > > +=09if (!cont)
> > > +=09=09return;
> > > +=09if (refcount_dec_and_test(&cont->refcount)) {
> > > +=09=09put_task_struct(cont->owner);
> > > +=09=09list_del_rcu(&cont->list);
> > > +=09=09kfree_rcu(cont, rcu);
> > > +=09}
> > > +}
> > > +
> > > +static struct task_struct *audit_cont_owner(struct task_struct *tsk)
> > > +{
> > > +=09if (tsk->audit && tsk->audit->cont)
> > > +=09=09return tsk->audit->cont->owner;
> > > +=09return NULL;
> > > +}
> > > +
> > >  /*
> > >   * audit_set_contid - set current task's audit contid
> > >   * @task: target task
> > > @@ -2382,9 +2420,12 @@ int audit_set_contid(struct task_struct *task,=
 u64 contid)
> > >  =09}
> > >  =09oldcontid =3D audit_get_contid(task);
> > >  =09read_lock(&tasklist_lock);
> > > -=09/* Don't allow the audit containerid to be unset */
> > > +=09/* Don't allow the contid to be unset */
> > >  =09if (!audit_contid_valid(contid))
> > >  =09=09rc =3D -EINVAL;
> > > +=09/* Don't allow the contid to be set to the same value again */
> > > +=09else if (contid =3D=3D oldcontid) {
> > > +=09=09rc =3D -EADDRINUSE;
> > >  =09/* if we don't have caps, reject */
> > >  =09else if (!capable(CAP_AUDIT_CONTROL))
> > >  =09=09rc =3D -EPERM;
> > > @@ -2397,8 +2438,43 @@ int audit_set_contid(struct task_struct *task,=
 u64 contid)
> > >  =09else if (audit_contid_set(task))
> > >  =09=09rc =3D -ECHILD;
> > >  =09read_unlock(&tasklist_lock);
> > > -=09if (!rc)
> > > -=09=09task->audit->contid =3D contid;
> > > +=09if (!rc) {
> > > +=09=09struct audit_cont *oldcont =3D audit_cont(task);
> > > +=09=09struct audit_cont *cont =3D NULL;
> > > +=09=09struct audit_cont *newcont =3D NULL;
> > > +=09=09int h =3D audit_hash_contid(contid);
> > > +
> > > +=09=09spin_lock(&audit_contid_list_lock);
> > > +=09=09list_for_each_entry_rcu(cont, &audit_contid_hash[h], list)
> > > +=09=09=09if (cont->id =3D=3D contid) {
> > > +=09=09=09=09/* task injection to existing container */
> > > +=09=09=09=09if (current =3D=3D cont->owner) {
> > > +=09=09=09=09=09refcount_inc(&cont->refcount);
> > > +=09=09=09=09=09newcont =3D cont;
> > > +=09=09=09=09} else {
> > > +=09=09=09=09=09rc =3D -ENOTUNIQ;
> > > +=09=09=09=09=09goto conterror;
> > > +=09=09=09=09}
> > > +=09=09=09}
> > > +=09=09if (!newcont) {
> > > +=09=09=09newcont =3D kmalloc(sizeof(struct audit_cont), GFP_ATOMIC);
> > > +=09=09=09if (newcont) {
> > > +=09=09=09=09INIT_LIST_HEAD(&newcont->list);
> > > +=09=09=09=09newcont->id =3D contid;
> > > +=09=09=09=09get_task_struct(current);
> > > +=09=09=09=09newcont->owner =3D current;
> > > +=09=09=09=09refcount_set(&newcont->refcount, 1);
> > > +=09=09=09=09list_add_rcu(&newcont->list, &audit_contid_hash[h]);
> > > +=09=09=09} else {
> > > +=09=09=09=09rc =3D -ENOMEM;
> > > +=09=09=09=09goto conterror;
> > > +=09=09=09}
> > > +=09=09}
> > > +=09=09task->audit->cont =3D newcont;
> > > +=09=09audit_cont_put(oldcont);
> > > +conterror:
> > > +=09=09spin_unlock(&audit_contid_list_lock);
> > > +=09}
> > >  =09task_unlock(task);
> > > =20
> > >  =09if (!audit_enabled)
> > > diff --git a/kernel/audit.h b/kernel/audit.h
> > > index 16bd03b88e0d..e4a31aa92dfe 100644
> > > --- a/kernel/audit.h
> > > +++ b/kernel/audit.h
> > > @@ -211,6 +211,14 @@ static inline int audit_hash_ino(u32 ino)
> > >  =09return (ino & (AUDIT_INODE_BUCKETS-1));
> > >  }
> > > =20
> > > +#define AUDIT_CONTID_BUCKETS=0932
> > > +extern struct list_head audit_contid_hash[AUDIT_CONTID_BUCKETS];
> > > +
> > > +static inline int audit_hash_contid(u64 contid)
> > > +{
> > > +=09return (contid & (AUDIT_CONTID_BUCKETS-1));
> > > +}
> > > +
> > >  /* Indicates that audit should log the full pathname. */
> > >  #define AUDIT_NAME_FULL -1
> > > =20
> > > --=20
> > > 1.8.3.1
> > >=20
> > >=20
>=20
> - RGB
>=20
> --
> Richard Guy Briggs <rgb@redhat.com>
> Sr. S/W Engineer, Kernel Security, Base Operating Systems
> Remote, Ottawa, Red Hat Canada
> IRC: rgb, SunRaycer
> Voice: +1.647.777.2635, Internal: (81) 32635
>=20
>=20

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

