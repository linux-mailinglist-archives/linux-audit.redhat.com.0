Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 0A438E3DEA
	for <lists+linux-audit@lfdr.de>; Thu, 24 Oct 2019 23:02:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1571950963;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=nKCgSUQcnfxHP76wlDs88YX9+EC3OuXZvAKqHclPNKU=;
	b=Wcumzb2bXhW116pDp8p70DDVFZknxmPgm9fLx5A+gKQq41JRSB9rqLFTEqXQRcxp678n7c
	GgXexahce6fVQKI54DqdloNndVxApBHShEKhWhEL4PaBVg8Tu9geFWTluI4cNW/Y1ofTVP
	uBtvzAsr2O3RBAJ+NB5cCjH3RzayUd0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-137-6MEIrmOxMBmNXOoZELscdQ-1; Thu, 24 Oct 2019 17:02:36 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EA559100551B;
	Thu, 24 Oct 2019 21:02:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 940F55C1B5;
	Thu, 24 Oct 2019 21:02:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E1C3F4E58A;
	Thu, 24 Oct 2019 21:02:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9OL0RAt019145 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 24 Oct 2019 17:00:27 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D773A601A2; Thu, 24 Oct 2019 21:00:27 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (ovpn-112-19.phx2.redhat.com [10.3.112.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4F67D6012E;
	Thu, 24 Oct 2019 21:00:13 +0000 (UTC)
Date: Thu, 24 Oct 2019 17:00:10 -0400
From: Richard Guy Briggs <rgb@redhat.com>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH ghak90 V7 20/21] audit: add capcontid to set contid
	outside init_user_ns
Message-ID: <20191024210010.owwgc3bqbvtdsqws@madcap2.tricolour.ca>
References: <cover.1568834524.git.rgb@redhat.com>
	<214163d11a75126f610bcedfad67a4d89575dc77.1568834525.git.rgb@redhat.com>
	<20191019013904.uevmrzbmztsbhpnh@madcap2.tricolour.ca>
	<CAHC9VhRPygA=LsHLUqv+K=ouAiPFJ6fb2_As=OT-_zB7kGc_aQ@mail.gmail.com>
	<20191021213824.6zti5ndxu7sqs772@madcap2.tricolour.ca>
	<CAHC9VhRdNXsY4neJpSoNyJoAVEoiEc2oW5kSscF99tjmoQAxFA@mail.gmail.com>
	<20191021235734.mgcjotdqoe73e4ha@madcap2.tricolour.ca>
	<CAHC9VhSiwnY-+2awxvGeO4a0NgfVkOPd8fzzBVujp=HtjskTuQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHC9VhSiwnY-+2awxvGeO4a0NgfVkOPd8fzzBVujp=HtjskTuQ@mail.gmail.com>
User-Agent: NeoMutt/20180716
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: 6MEIrmOxMBmNXOoZELscdQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On 2019-10-21 20:31, Paul Moore wrote:
> On Mon, Oct 21, 2019 at 7:58 PM Richard Guy Briggs <rgb@redhat.com> wrote=
:
> > On 2019-10-21 17:43, Paul Moore wrote:
> > > On Mon, Oct 21, 2019 at 5:38 PM Richard Guy Briggs <rgb@redhat.com> w=
rote:
> > > > On 2019-10-21 15:53, Paul Moore wrote:
> > > > > On Fri, Oct 18, 2019 at 9:39 PM Richard Guy Briggs <rgb@redhat.co=
m> wrote:
> > > > > > On 2019-09-18 21:22, Richard Guy Briggs wrote:
> > > > > > > Provide a mechanism similar to CAP_AUDIT_CONTROL to explicitl=
y give a
> > > > > > > process in a non-init user namespace the capability to set au=
dit
> > > > > > > container identifiers.
> > > > > > >
> > > > > > > Use audit netlink message types AUDIT_GET_CAPCONTID 1027 and
> > > > > > > AUDIT_SET_CAPCONTID 1028.  The message format includes the da=
ta
> > > > > > > structure:
> > > > > > > struct audit_capcontid_status {
> > > > > > >         pid_t   pid;
> > > > > > >         u32     enable;
> > > > > > > };
> > > > > >
> > > > > > Paul, can I get a review of the general idea here to see if you=
're ok
> > > > > > with this way of effectively extending CAP_AUDIT_CONTROL for th=
e sake of
> > > > > > setting contid from beyond the init user namespace where capabl=
e() can't
> > > > > > reach and ns_capable() is meaningless for these purposes?
> > > > >
> > > > > I think my previous comment about having both the procfs and netl=
ink
> > > > > interfaces apply here.  I don't see why we need two different API=
s at
> > > > > the start; explain to me why procfs isn't sufficient.  If the arg=
ument
> > > > > is simply the desire to avoid mounting procfs in the container, h=
ow
> > > > > many container orchestrators can function today without a valid /=
proc?
> > > >
> > > > Ok, sorry, I meant to address that question from a previous patch
> > > > comment at the same time.
> > > >
> > > > It was raised by Eric Biederman that the proc filesystem interface =
for
> > > > audit had its limitations and he had suggested an audit netlink
> > > > interface made more sense.
> > >
> > > I'm sure you've got it handy, so I'm going to be lazy and ask: archiv=
e
> > > pointer to Eric's comments?  Just a heads-up, I'm really *not* a fan
> > > of using the netlink interface for this, so unless Eric presents a
> > > super compelling reason for why we shouldn't use procfs I'm inclined
> > > to stick with /proc.
> >
> > It was actually a video call with Eric and Steve where that was
> > recommended, so I can't provide you with any first-hand communication
> > about it.  I'll get more details...
>=20
> Yeah, that sort of information really needs to be on the list.

Here's the note I had from that meeting:

- Eric raised the issue that using /proc is likely to get more and more
  hoary due to mount namespaces and suggested that we use a netlink
audit message (or a new syscall) to set the audit container identifier
and since the loginuid is a similar type of operation, that it should be
migrated over to a similar mechanism to get it away from /proc.  Get
could be done with a netlink audit message that triggers an audit log
message to deliver the information.  I'm reluctant to further pollute
the syscall space if we can find another method.  The netlink audit
message makes sense since any audit-enabled service is likely to already
have an audit socket open.

I don't have more detailed notes about what Eric said specifically.

> > So, with that out of the way, could you please comment on the general
> > idea of what was intended to be the central idea of this mechanism to b=
e
> > able to nest containers beyond the initial user namespace (knowing that
> > a /proc interface is available and the audit netlink interface isn't
> > necessary for it to work and the latter can be easily removed)?
>=20
> I'm not entirely clear what you are asking about, are you asking why I
> care about nesting container orchestrators?  Simply put, it is not
> uncommon for the LXC/LXD folks to see nested container orchestrators,
> so I felt it was important to support that use case.  When we
> originally started this effort we probably should have done a better
> job reaching out to the LXC/LXD folks, we may have caught this
> earlier.  Regardless, we caught it, and it looks like we are on our
> way to supporting it (that's good).
>=20
> Are you asking why I prefer the procfs approach to setting/getting the
> audit container ID?  For one, it makes it easier for a LSM to enforce
> the audit container ID operations independent of the other audit
> control APIs.  It also provides a simpler interface for container
> orchestrators.  Both seem like desirable traits as far as I'm
> concerned.
>=20
> > > > The intent was to switch to the audit netlink interface for contid,
> > > > capcontid and to add the audit netlink interface for loginuid and
> > > > sessionid while deprecating the proc interface for loginuid and
> > > > sessionid.  This was alluded to in the cover letter, but not very c=
lear,
> > > > I'm afraid.  I have patches to remove the contid and loginuid/sessi=
onid
> > > > interfaces in another tree which is why I had forgotten to outline =
that
> > > > plan more explicitly in the cover letter.
>=20
> --=20
> paul moore
> www.paul-moore.com

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

