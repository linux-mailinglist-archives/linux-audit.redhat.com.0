Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id EF0F0E03AD
	for <lists+linux-audit@lfdr.de>; Tue, 22 Oct 2019 14:15:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1571746520;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=dGe8k50M4PkU3qz9DDEkwLAT9NtDxTQkTr8pBuRqHgg=;
	b=bwkJ1ScC1A2dL4UoTsAA++Qn3a5TK8v8Rib6b2aJLpS7aKc0j9qfVX2KozjC/evh5kOVaA
	leWbqqko47s2/foL++65mfYukA5EeLH3WE9WIbmFhWrgcS8uFAKoh13mKBhLeh6pP+ioUV
	TjGX4F5j6CsRZUOQSVlRtQhHCoYNTRY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-90-NtkKCrx4NeSKiYgNdriF7A-1; Tue, 22 Oct 2019 08:15:18 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0ED9B1005500;
	Tue, 22 Oct 2019 12:15:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 38FFB52C9;
	Tue, 22 Oct 2019 12:15:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CF8ED4EE6D;
	Tue, 22 Oct 2019 12:15:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9MCExQ7028282 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 22 Oct 2019 08:14:59 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 80FBE194BB; Tue, 22 Oct 2019 12:14:59 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx21.extmail.prod.ext.phx2.redhat.com
	[10.5.110.62])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B67833CCA;
	Tue, 22 Oct 2019 12:14:48 +0000 (UTC)
Received: from smtp.tuxdriver.com (charlotte.tuxdriver.com [70.61.120.58])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C25E918C4262;
	Tue, 22 Oct 2019 12:13:24 +0000 (UTC)
Received: from cpe-2606-a000-111b-43ee-0-0-0-115f.dyn6.twc.com
	([2606:a000:111b:43ee::115f] helo=localhost)
	by smtp.tuxdriver.com with esmtpsa (TLSv1:AES256-SHA:256) (Exim 4.63)
	(envelope-from <nhorman@tuxdriver.com>)
	id 1iMt2B-00038h-L6; Tue, 22 Oct 2019 08:13:10 -0400
Date: Tue, 22 Oct 2019 08:13:02 -0400
From: Neil Horman <nhorman@tuxdriver.com>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH ghak90 V7 20/21] audit: add capcontid to set contid
	outside init_user_ns
Message-ID: <20191022121302.GA9397@hmswarspite.think-freely.org>
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
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Spam-Status: No
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.6.2 (mx1.redhat.com
	[10.5.110.62]); Tue, 22 Oct 2019 12:14:41 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.62]);
	Tue, 22 Oct 2019 12:14:41 +0000 (UTC) for IP:'70.61.120.58'
	DOMAIN:'charlotte.tuxdriver.com' HELO:'smtp.tuxdriver.com'
	FROM:'nhorman@tuxdriver.com' RCPT:''
X-RedHat-Spam-Score: 0  (RCVD_IN_DNSWL_NONE, SPF_HELO_NONE,
	SPF_PASS) 70.61.120.58 charlotte.tuxdriver.com
	70.61.120.58 charlotte.tuxdriver.com <nhorman@tuxdriver.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.62
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: NtkKCrx4NeSKiYgNdriF7A-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Mon, Oct 21, 2019 at 08:31:37PM -0400, Paul Moore wrote:
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
>=20
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
I agree that one api is probably the best approach here, but I actually
think that the netlink interface is the more flexible approach.  Its a
little more work for userspace (you have to marshal your data into a
netlink message before sending it, and wait for an async response), but
thats a well known pattern, and it provides significantly more
flexibility for the kernel.  LSM already has a hook to audit netlink
messages in sock_sendmsg, so thats not a problem, and if you use
netlink, you get the advantage of being able to broadcast messages
within your network namespaces, facilitating any needed orchestrator
co-ordination.  To do the same thing with a filesystem api, you need to
use the fanotify api, which IIRC doesn't work on proc.

Neil

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
>=20

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

