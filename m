Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 15253F52B9
	for <lists+linux-audit@lfdr.de>; Fri,  8 Nov 2019 18:42:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573234922;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=EK8IlLKAi7QgP/pGJ7t7s3RDm1FFj6EeyRw8yR9QvBE=;
	b=ZcuOszcWeTVBSkan8XIJm1f8dqXVQzlDjHCfm2PoYCAoLHBKXyVOAL9pPLqN9v1mOExIv4
	vJcCnizT3e5nFgs4JQQP0DG/xqCznAW2DLiVud+qT0hQrOu93ecEjox5va2VWlZwKX3m2N
	dTQHtM38VBGXba4yMarwdNC40tpeDWM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-60-EkN91xwmM2G8iXFres6aBg-1; Fri, 08 Nov 2019 12:42:00 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2EC291800D99;
	Fri,  8 Nov 2019 17:41:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 441EE1001B05;
	Fri,  8 Nov 2019 17:41:52 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 69DC84BB65;
	Fri,  8 Nov 2019 17:41:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xA8HfXev023175 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 8 Nov 2019 12:41:33 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 12E6560C18; Fri,  8 Nov 2019 17:41:33 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.39])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0B7D660BE2
	for <linux-audit@redhat.com>; Fri,  8 Nov 2019 17:41:30 +0000 (UTC)
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D71B95D611
	for <linux-audit@redhat.com>; Fri,  8 Nov 2019 17:41:28 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id m9so7070137ljh.8
	for <linux-audit@redhat.com>; Fri, 08 Nov 2019 09:41:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=2QJNYK/K5bdE2+Gkhht7sK48ftHkXUxqx+uBQkHd5Ts=;
	b=Z5mEP8YaR2W9oe7ocYl5cDGTlqmX4QMrErViPzqEBVJFF1/qsfgB5kUMpecUab7IQx
	v1yzmKwQ8muRUeF+/olGKr36SNpgb4Z0HZYChCwqGviuoz8ckONIaUQP650wiwW0oX6N
	dnX+uSXISin4xtgg+0wfLtXI5NcS4/iVID2X38VXnfag0SDk2SX+NU2tpBWftPA/jXd1
	Yhgrs6O00aRkon3JfOuv2oStH6B44fr29PPb4BibrIwQ1EjAsJ9pMZB1fihU/o170kpW
	U7Ho/nVf9mo6KOVDvIZxmTIJCBKqJJyhYcfvYet0Kmipb+NCPJuHgWqGBPO04g0VCSwj
	f84g==
X-Gm-Message-State: APjAAAVZhlT1SPuJRD4ppdBgo7xK/G1TZ6PJ8nXyKvRLo+EvkDr4lBbo
	WyfWj3Z9M6Yxed/nxdPnPv+eFWxupPAvXgC+A+eb
X-Google-Smtp-Source: APXvYqygpkXBVo+V/0rCDrfRnTBOydni+js2TBbay/jXRxqEePu5DxdbEDyaefBi0zEpgdxZttma4OhRzmRZQpH1wy4=
X-Received: by 2002:a2e:4703:: with SMTP id u3mr584888lja.126.1573234887049;
	Fri, 08 Nov 2019 09:41:27 -0800 (PST)
MIME-Version: 1.0
References: <cover.1568834524.git.rgb@redhat.com>
	<0850eaa785e2ff30c8c4818fd53e9544b34ed884.1568834524.git.rgb@redhat.com>
	<CAHC9VhQoFFaQACbV4QHG_NPUCJu1+V=x3=i-yyGjbsYq8HuPtg@mail.gmail.com>
	<20191025192031.ul3yjy2q57vsvier@madcap2.tricolour.ca>
In-Reply-To: <20191025192031.ul3yjy2q57vsvier@madcap2.tricolour.ca>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 8 Nov 2019 12:41:16 -0500
Message-ID: <CAHC9VhQTz3f9p9knMP0Rsz=zH5HTEXBb7iN7o_jr=FN9sGWp8g@mail.gmail.com>
Subject: Re: [PATCH ghak90 V7 08/21] audit: add contid support for signalling
	the audit daemon
To: Richard Guy Briggs <rgb@redhat.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Fri, 08 Nov 2019 17:41:29 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]);
	Fri, 08 Nov 2019 17:41:29 +0000 (UTC) for IP:'209.85.208.194'
	DOMAIN:'mail-lj1-f194.google.com'
	HELO:'mail-lj1-f194.google.com' FROM:'paul@paul-moore.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_NONE) 209.85.208.194 mail-lj1-f194.google.com 209.85.208.194
	mail-lj1-f194.google.com <paul@paul-moore.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.39
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
X-MC-Unique: EkN91xwmM2G8iXFres6aBg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 25, 2019 at 3:20 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> On 2019-10-10 20:39, Paul Moore wrote:
> > On Wed, Sep 18, 2019 at 9:25 PM Richard Guy Briggs <rgb@redhat.com> wro=
te:
> > > Add audit container identifier support to the action of signalling th=
e
> > > audit daemon.
> > >
> > > Since this would need to add an element to the audit_sig_info struct,
> > > a new record type AUDIT_SIGNAL_INFO2 was created with a new
> > > audit_sig_info2 struct.  Corresponding support is required in the
> > > userspace code to reflect the new record request and reply type.
> > > An older userspace won't break since it won't know to request this
> > > record type.
> > >
> > > Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> > > ---
> > >  include/linux/audit.h       |  7 +++++++
> > >  include/uapi/linux/audit.h  |  1 +
> > >  kernel/audit.c              | 28 ++++++++++++++++++++++++++++
> > >  kernel/audit.h              |  1 +
> > >  security/selinux/nlmsgtab.c |  1 +
> > >  5 files changed, 38 insertions(+)
> > >
> > > diff --git a/include/linux/audit.h b/include/linux/audit.h
> > > index 0c18d8e30620..7b640c4da4ee 100644
> > > --- a/include/linux/audit.h
> > > +++ b/include/linux/audit.h
> > > @@ -23,6 +23,13 @@ struct audit_sig_info {
> > >         char            ctx[0];
> > >  };
> > >
> > > +struct audit_sig_info2 {
> > > +       uid_t           uid;
> > > +       pid_t           pid;
> > > +       u64             cid;
> > > +       char            ctx[0];
> > > +};
> > > +
> > >  struct audit_buffer;
> > >  struct audit_context;
> > >  struct inode;
> > > diff --git a/include/uapi/linux/audit.h b/include/uapi/linux/audit.h
> > > index 4ed080f28b47..693ec6e0288b 100644
> > > --- a/include/uapi/linux/audit.h
> > > +++ b/include/uapi/linux/audit.h
> > > @@ -72,6 +72,7 @@
> > >  #define AUDIT_SET_FEATURE      1018    /* Turn an audit feature on o=
r off */
> > >  #define AUDIT_GET_FEATURE      1019    /* Get which features are ena=
bled */
> > >  #define AUDIT_CONTAINER_OP     1020    /* Define the container id an=
d info */
> > > +#define AUDIT_SIGNAL_INFO2     1021    /* Get info auditd signal sen=
der */
> > >
> > >  #define AUDIT_FIRST_USER_MSG   1100    /* Userspace messages mostly =
uninteresting to kernel */
> > >  #define AUDIT_USER_AVC         1107    /* We filter this differently=
 */
> > > diff --git a/kernel/audit.c b/kernel/audit.c
> > > index adfb3e6a7f0c..df3db29f5a8a 100644
> > > --- a/kernel/audit.c
> > > +++ b/kernel/audit.c
> > > @@ -125,6 +125,7 @@ struct audit_net {
> > >  kuid_t         audit_sig_uid =3D INVALID_UID;
> > >  pid_t          audit_sig_pid =3D -1;
> > >  u32            audit_sig_sid =3D 0;
> > > +u64            audit_sig_cid =3D AUDIT_CID_UNSET;
> > >
> > >  /* Records can be lost in several ways:
> > >     0) [suppressed in audit_alloc]
> > > @@ -1094,6 +1095,7 @@ static int audit_netlink_ok(struct sk_buff *skb=
, u16 msg_type)
> > >         case AUDIT_ADD_RULE:
> > >         case AUDIT_DEL_RULE:
> > >         case AUDIT_SIGNAL_INFO:
> > > +       case AUDIT_SIGNAL_INFO2:
> > >         case AUDIT_TTY_GET:
> > >         case AUDIT_TTY_SET:
> > >         case AUDIT_TRIM:
> > > @@ -1257,6 +1259,7 @@ static int audit_receive_msg(struct sk_buff *sk=
b, struct nlmsghdr *nlh)
> > >         struct audit_buffer     *ab;
> > >         u16                     msg_type =3D nlh->nlmsg_type;
> > >         struct audit_sig_info   *sig_data;
> > > +       struct audit_sig_info2  *sig_data2;
> > >         char                    *ctx =3D NULL;
> > >         u32                     len;
> > >
> > > @@ -1516,6 +1519,30 @@ static int audit_receive_msg(struct sk_buff *s=
kb, struct nlmsghdr *nlh)
> > >                                  sig_data, sizeof(*sig_data) + len);
> > >                 kfree(sig_data);
> > >                 break;
> > > +       case AUDIT_SIGNAL_INFO2:
> > > +               len =3D 0;
> > > +               if (audit_sig_sid) {
> > > +                       err =3D security_secid_to_secctx(audit_sig_si=
d, &ctx, &len);
> > > +                       if (err)
> > > +                               return err;
> > > +               }
> > > +               sig_data2 =3D kmalloc(sizeof(*sig_data2) + len, GFP_K=
ERNEL);
> > > +               if (!sig_data2) {
> > > +                       if (audit_sig_sid)
> > > +                               security_release_secctx(ctx, len);
> > > +                       return -ENOMEM;
> > > +               }
> > > +               sig_data2->uid =3D from_kuid(&init_user_ns, audit_sig=
_uid);
> > > +               sig_data2->pid =3D audit_sig_pid;
> > > +               if (audit_sig_sid) {
> > > +                       memcpy(sig_data2->ctx, ctx, len);
> > > +                       security_release_secctx(ctx, len);
> > > +               }
> > > +               sig_data2->cid =3D audit_sig_cid;
> > > +               audit_send_reply(skb, seq, AUDIT_SIGNAL_INFO2, 0, 0,
> > > +                                sig_data2, sizeof(*sig_data2) + len)=
;
> > > +               kfree(sig_data2);
> > > +               break;
> > >         case AUDIT_TTY_GET: {
> > >                 struct audit_tty_status s;
> > >                 unsigned int t;
> > > @@ -2384,6 +2411,7 @@ int audit_signal_info(int sig, struct task_stru=
ct *t)
> > >                 else
> > >                         audit_sig_uid =3D uid;
> > >                 security_task_getsecid(current, &audit_sig_sid);
> > > +               audit_sig_cid =3D audit_get_contid(current);
> > >         }
> >
> > I've been wondering something as I've been working my way through
> > these patches and this patch seems like a good spot to discuss this
> > ... Now that we have the concept of an audit container ID "lifetime"
> > in the kernel, when do we consider the ID gone?  Is it when the last
> > process in the container exits, or is it when we generate the last
> > audit record which could possibly contain the audit container ID?
> > This patch would appear to support the former, but if we wanted the
> > latter we would need to grab a reference to the audit container ID
> > struct so it wouldn't "die" on us before we could emit the signal info
> > record.
>
> Are you concerned with the availability of the data when the audit
> signal info record is generated, when the kernel last deals with a
> particular contid or when userspace thinks there will be no more
> references to it?
>
> I've got a bit of a dilemma with this one...
>
> In fact, the latter situation you describe isn't a concern at present to
> be able to deliver the information since the value is copied into the
> audit signal global internal variables before the signalling task dies
> and the audit signal info record is created from those copied (cached)
> values when requested from userspace.
>
> So the issue raised above I don't think is a problem.  However, patch 18
> (which wasn't reviewed because it was a patch to a number of preceeding
> patches) changes the reporting approach to give a chain of nested
> contids which isn't reflected in the same level of reporting for the
> audit signal patch/mechanism.  Solving this is a bit more complex.  We
> could have the audit signal internal caching store a pointer to the
> relevant container object and bump its refcount to ensure it doesn't
> vanish until we are done with it, but the audit signal info binary
> record format already has a variable length due to the selinux context
> at the end of that struct and adding a second variable length element to
> it would make it more complicated (but not impossible) to handle.

[side note #1: Sorry for the delay, travel/conferences have limited my
time and I felt we needed to focus on the larger issue of
netlink/procfs first.  Back to the other topics ...]

[side note #2: I just realized that one can shorten "audit container
ID" to ACID, I think that's going to be my favorite realization of the
day :)]

My concern wasn't really about the availability of the data, since as
you said, it is copied into the record buffer, but rather a delay
between when the audit container ID (ACID) disappears from the
tracking/list db in the kernel to when it is emitted in an audit
record from the kernel.  During this time is seems like it could be
possible for the orchestrator to reintroduce the same ACID value and
if someone is not taking into account the full audit history they
could get confused (the full audit history should show the proper
creation/destruction events in the correct order).  Ultimately I'm not
sure it is a major issue, and fixing it is likely to be really ugly,
but I think it would be good to add some comments in the code
regarding what we guarantee as far as ACID lifetimes are concerned.

--=20
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

