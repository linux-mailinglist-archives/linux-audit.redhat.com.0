Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id A2FBAE05E7
	for <lists+linux-audit@lfdr.de>; Tue, 22 Oct 2019 16:05:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1571753127;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=mYeRQ8GJy1ZMAYQv92uQJSkDPRxG3/3sXRDlr+IoPTs=;
	b=ap1F9EiFvmr5ylMxpGlp5j6EuQujxYXwf0/TTbpF7jC9AJdmuvN82TLcRA/DvHaZuv0in2
	reBWXoHyoysivhYWrg9kDaPzDcW1c3rQPLBD3iATPyhw+ZNYL/eNM7i21rYeH1h7O+YvG6
	Xg7ryyr8t2bnjKUeUYXvZHNDbNFLZfY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-135-1eJzoeqrMzSmHv_lIUpx1w-1; Tue, 22 Oct 2019 10:05:22 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8FA72800D53;
	Tue, 22 Oct 2019 14:05:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2F15D5C1D4;
	Tue, 22 Oct 2019 14:05:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 20B2D18089DC;
	Tue, 22 Oct 2019 14:05:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9ME50L9004186 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 22 Oct 2019 10:05:00 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 135A05C22C; Tue, 22 Oct 2019 14:05:00 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0DA8E5C219
	for <linux-audit@redhat.com>; Tue, 22 Oct 2019 14:04:57 +0000 (UTC)
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 54D9981F0F
	for <linux-audit@redhat.com>; Tue, 22 Oct 2019 14:04:55 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id m7so17360790lji.2
	for <linux-audit@redhat.com>; Tue, 22 Oct 2019 07:04:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ipC7lKranNQEvA5XU+w8tItfggky3gdViyHT7vnw0C0=;
	b=ZuNDHpAvb7r+IiIG66cITIovPV8eR3w4E602mSn6JFeyjUwt5iK9Zkqjqck60WzkzK
	8VySXU4WLZCdpMz1Q6pf9QfRChKQWt6HlcoiVnnQoeYqWQHys+/SZ/jS1W9L17hnfxsI
	r2SA30ngvJR93CQUO0NEh7/AFArowxHKdFUd8HX6cGrmhImbsvErfzSeP32v8/gHoL7q
	a9VBWbxUGoVoPfwqnK4y5T/8BoF12WV+yK1/K5RS7+S4P3t3Ck2jv6BLJPZO+xxh/4rc
	XGqqZ4GLsiMZ7zmtjOMT9rqlArwEuJIB1uZeLtU+4ac9s2uc4yWx1ZMXmTXehzGOHBGG
	s86Q==
X-Gm-Message-State: APjAAAXFMMSFMzDM6dLfakOx6fxp6XidQtB/yIw19SXDarcqIrn+Y04v
	nAThI4hK2gcE2Dumqoi1w0pDYj5LxXJpjyC8p/9X
X-Google-Smtp-Source: APXvYqwFBZDUQ0/QjLsJo0IeE0Yc9upPM94hvttzaBBAf7xgaQ3dTK8YpaN75qrFnlhAnGP25Lx4f2CFRdTTFtYlyHM=
X-Received: by 2002:a2e:58d:: with SMTP id 135mr3093698ljf.57.1571753093369;
	Tue, 22 Oct 2019 07:04:53 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1568834524.git.rgb@redhat.com>
	<214163d11a75126f610bcedfad67a4d89575dc77.1568834525.git.rgb@redhat.com>
	<20191019013904.uevmrzbmztsbhpnh@madcap2.tricolour.ca>
	<CAHC9VhRPygA=LsHLUqv+K=ouAiPFJ6fb2_As=OT-_zB7kGc_aQ@mail.gmail.com>
	<20191021213824.6zti5ndxu7sqs772@madcap2.tricolour.ca>
	<CAHC9VhRdNXsY4neJpSoNyJoAVEoiEc2oW5kSscF99tjmoQAxFA@mail.gmail.com>
	<20191021235734.mgcjotdqoe73e4ha@madcap2.tricolour.ca>
	<CAHC9VhSiwnY-+2awxvGeO4a0NgfVkOPd8fzzBVujp=HtjskTuQ@mail.gmail.com>
	<20191022121302.GA9397@hmswarspite.think-freely.org>
In-Reply-To: <20191022121302.GA9397@hmswarspite.think-freely.org>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 22 Oct 2019 10:04:42 -0400
Message-ID: <CAHC9VhRs-1FOu_QpW5OCATjrPpCFwSzUr+Lk81t-C_wfRGWLBA@mail.gmail.com>
Subject: Re: [PATCH ghak90 V7 20/21] audit: add capcontid to set contid
	outside init_user_ns
To: Neil Horman <nhorman@tuxdriver.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Tue, 22 Oct 2019 14:04:55 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]);
	Tue, 22 Oct 2019 14:04:55 +0000 (UTC) for IP:'209.85.208.193'
	DOMAIN:'mail-lj1-f193.google.com'
	HELO:'mail-lj1-f193.google.com' FROM:'paul@paul-moore.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_NONE) 209.85.208.193 mail-lj1-f193.google.com 209.85.208.193
	mail-lj1-f193.google.com <paul@paul-moore.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.27
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: linux-audit@redhat.com
Cc: Richard Guy Briggs <rgb@redhat.com>, linux-api@vger.kernel.org,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: 1eJzoeqrMzSmHv_lIUpx1w-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 22, 2019 at 8:13 AM Neil Horman <nhorman@tuxdriver.com> wrote:
> On Mon, Oct 21, 2019 at 08:31:37PM -0400, Paul Moore wrote:
> > On Mon, Oct 21, 2019 at 7:58 PM Richard Guy Briggs <rgb@redhat.com> wro=
te:
> > > On 2019-10-21 17:43, Paul Moore wrote:
> > > > On Mon, Oct 21, 2019 at 5:38 PM Richard Guy Briggs <rgb@redhat.com>=
 wrote:
> > > > > On 2019-10-21 15:53, Paul Moore wrote:
> > > > > > On Fri, Oct 18, 2019 at 9:39 PM Richard Guy Briggs <rgb@redhat.=
com> wrote:
> > > > > > > On 2019-09-18 21:22, Richard Guy Briggs wrote:
> > > > > > > > Provide a mechanism similar to CAP_AUDIT_CONTROL to explici=
tly give a
> > > > > > > > process in a non-init user namespace the capability to set =
audit
> > > > > > > > container identifiers.
> > > > > > > >
> > > > > > > > Use audit netlink message types AUDIT_GET_CAPCONTID 1027 an=
d
> > > > > > > > AUDIT_SET_CAPCONTID 1028.  The message format includes the =
data
> > > > > > > > structure:
> > > > > > > > struct audit_capcontid_status {
> > > > > > > >         pid_t   pid;
> > > > > > > >         u32     enable;
> > > > > > > > };
> > > > > > >
> > > > > > > Paul, can I get a review of the general idea here to see if y=
ou're ok
> > > > > > > with this way of effectively extending CAP_AUDIT_CONTROL for =
the sake of
> > > > > > > setting contid from beyond the init user namespace where capa=
ble() can't
> > > > > > > reach and ns_capable() is meaningless for these purposes?
> > > > > >
> > > > > > I think my previous comment about having both the procfs and ne=
tlink
> > > > > > interfaces apply here.  I don't see why we need two different A=
PIs at
> > > > > > the start; explain to me why procfs isn't sufficient.  If the a=
rgument
> > > > > > is simply the desire to avoid mounting procfs in the container,=
 how
> > > > > > many container orchestrators can function today without a valid=
 /proc?
> > > > >
> > > > > Ok, sorry, I meant to address that question from a previous patch
> > > > > comment at the same time.
> > > > >
> > > > > It was raised by Eric Biederman that the proc filesystem interfac=
e for
> > > > > audit had its limitations and he had suggested an audit netlink
> > > > > interface made more sense.
> > > >
> > > > I'm sure you've got it handy, so I'm going to be lazy and ask: arch=
ive
> > > > pointer to Eric's comments?  Just a heads-up, I'm really *not* a fa=
n
> > > > of using the netlink interface for this, so unless Eric presents a
> > > > super compelling reason for why we shouldn't use procfs I'm incline=
d
> > > > to stick with /proc.
> > >
> > > It was actually a video call with Eric and Steve where that was
> > > recommended, so I can't provide you with any first-hand communication
> > > about it.  I'll get more details...
> >
> > Yeah, that sort of information really needs to be on the list.
> >
> > > So, with that out of the way, could you please comment on the general
> > > idea of what was intended to be the central idea of this mechanism to=
 be
> > > able to nest containers beyond the initial user namespace (knowing th=
at
> > > a /proc interface is available and the audit netlink interface isn't
> > > necessary for it to work and the latter can be easily removed)?
> >
> > I'm not entirely clear what you are asking about, are you asking why I
> > care about nesting container orchestrators?  Simply put, it is not
> > uncommon for the LXC/LXD folks to see nested container orchestrators,
> > so I felt it was important to support that use case.  When we
> > originally started this effort we probably should have done a better
> > job reaching out to the LXC/LXD folks, we may have caught this
> > earlier.  Regardless, we caught it, and it looks like we are on our
> > way to supporting it (that's good).
> >
> > Are you asking why I prefer the procfs approach to setting/getting the
> > audit container ID?  For one, it makes it easier for a LSM to enforce
> > the audit container ID operations independent of the other audit
> > control APIs.  It also provides a simpler interface for container
> > orchestrators.  Both seem like desirable traits as far as I'm
> > concerned.
> >
> I agree that one api is probably the best approach here, but I actually
> think that the netlink interface is the more flexible approach.  Its a
> little more work for userspace (you have to marshal your data into a
> netlink message before sending it, and wait for an async response), but
> thats a well known pattern, and it provides significantly more
> flexibility for the kernel.  LSM already has a hook to audit netlink
> messages in sock_sendmsg, so thats not a problem ...

Look closely at how the LSM controls for netlink work and you'll see a
number of problems; basically command level granularity it hard.  On
the other hand, per-file granularity it easy.

> ... and if you use
> netlink, you get the advantage of being able to broadcast messages
> within your network namespaces, facilitating any needed orchestrator
> co-ordination.

Please don't read this comment as support of the netlink approach, but
I don't think we want to use the multicast netlink; we would want it
to be more of client/server model so that we could enforce access
controls a bit easier.  Besides, is this even a use case?

> To do the same thing with a filesystem api, you need to
> use the fanotify api, which IIRC doesn't work on proc.

Once again, I'm not sure this is a problem we are trying to solve
(broadcasting audit container ID across multiple tasks), is it?
Access to the audit container ID in userspace is something I've always
thought needs to be tightly controlled to prevent abuse.

--=20
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

