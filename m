Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 13A4D25E380
	for <lists+linux-audit@lfdr.de>; Fri,  4 Sep 2020 23:53:49 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-456-EDQtCJ5JNX-MlUIc9pNCqQ-1; Fri, 04 Sep 2020 17:53:47 -0400
X-MC-Unique: EDQtCJ5JNX-MlUIc9pNCqQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9BA45801ABB;
	Fri,  4 Sep 2020 21:53:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5897660C0F;
	Fri,  4 Sep 2020 21:53:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 153BE972E1;
	Fri,  4 Sep 2020 21:53:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 084Lrdgg027747 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 4 Sep 2020 17:53:39 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1C3AB2156A23; Fri,  4 Sep 2020 21:53:39 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1761E2166B27
	for <linux-audit@redhat.com>; Fri,  4 Sep 2020 21:53:35 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CED7C101A568
	for <linux-audit@redhat.com>; Fri,  4 Sep 2020 21:53:35 +0000 (UTC)
Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com
	[209.85.218.68]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-272-xIZGY_SVOD2fAotJahjeSA-1; Fri, 04 Sep 2020 17:53:33 -0400
X-MC-Unique: xIZGY_SVOD2fAotJahjeSA-1
Received: by mail-ej1-f68.google.com with SMTP id q13so10410928ejo.9
	for <linux-audit@redhat.com>; Fri, 04 Sep 2020 14:53:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=jNg27iV6ZItAX1i9WvBcKCyLaUSr/yFZulVErl2OY3Y=;
	b=hF2TfUnsZrW4iBNlSq0cFiPZKpS4NliR9raZISvXHeFhu0GvwhSS2ighGK+9ZGpzOX
	yu3CvXKKOuqaWMD4QKkHTzqF3rYsg1VLKHDnFnz3HCZ1IqmHLnZlBmxxbnnRXX7j5XIv
	3xDT8ddcK1sr9Bo9Jyjs4Rb0Ixj41f/NDMBlSw97SRH+Z5D/qICHbtKLEsmqzlGG+rc5
	XVMV5XzBo/UFaXr0pmopCbX3J+X1FXmKlAsrhXC4qZZDDAaYQ0lOfu+VnNrhHz3698PB
	rnhp8/I4aOBT6c6qeIAiOAo/e3c6OIVvhPRLTGtct6Kes0O9EXD6a2hBD7oGQaxprXxw
	AJOg==
X-Gm-Message-State: AOAM531DzeCoCQeOKNaykWfLm0lz83Y63Q1zcn24QOUDPTrZ63jbSEFY
	nPvi+1delWntNZ7ZhiyL3nbsK5FzE7sKtgbD1244
X-Google-Smtp-Source: ABdhPJzOzNTggIkvhW7jMB/WAk/9OaUfUmIFluDsTgrwQTA3qZgrujpGyKOyNmcV1DSfTZmXKw8y8FROdfbmjmY28LE=
X-Received: by 2002:a17:906:43c9:: with SMTP id
	j9mr9582131ejn.542.1599256412325; 
	Fri, 04 Sep 2020 14:53:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200826145247.10029-1-casey@schaufler-ca.com>
	<20200826145247.10029-6-casey@schaufler-ca.com>
	<CAHC9VhSh=r4w_3mZOUwmKN0UxCMxPNGKd=_vr_iGV06rvCNbSA@mail.gmail.com>
	<1eeef766-405f-3800-c0cf-3eb008f9673e@schaufler-ca.com>
In-Reply-To: <1eeef766-405f-3800-c0cf-3eb008f9673e@schaufler-ca.com>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 4 Sep 2020 17:53:21 -0400
Message-ID: <CAHC9VhSf8RWUnRPYLR6LLzbn-cvNg8J0wnZGwTOAe=dOqkvd0g@mail.gmail.com>
Subject: Re: [PATCH v20 05/23] net: Prepare UDS for security module stacking
To: Casey Schaufler <casey@schaufler-ca.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-audit@redhat.com
Cc: john.johansen@canonical.com, selinux@vger.kernel.org,
	James Morris <jmorris@namei.org>,
	linux-security-module@vger.kernel.org, linux-audit@redhat.com,
	casey.schaufler@intel.com, Stephen Smalley <sds@tycho.nsa.gov>
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Sep 4, 2020 at 5:35 PM Casey Schaufler <casey@schaufler-ca.com> wrote:
> On 9/4/2020 1:08 PM, Paul Moore wrote:
> > On Wed, Aug 26, 2020 at 11:07 AM Casey Schaufler <casey@schaufler-ca.com> wrote:
> >> Change the data used in UDS SO_PEERSEC processing from a
> >> secid to a more general struct lsmblob. Update the
> >> security_socket_getpeersec_dgram() interface to use the
> >> lsmblob. There is a small amount of scaffolding code
> >> that will come out when the security_secid_to_secctx()
> >> code is brought in line with the lsmblob.
> >>
> >> Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
> >> ---
> >>  include/linux/security.h |  7 +++++--
> >>  include/net/af_unix.h    |  2 +-
> >>  include/net/scm.h        |  8 +++++---
> >>  net/ipv4/ip_sockglue.c   |  8 +++++---
> >>  net/unix/af_unix.c       |  6 +++---
> >>  security/security.c      | 18 +++++++++++++++---
> >>  6 files changed, 34 insertions(+), 15 deletions(-)
> > ...
> >
> >> diff --git a/include/net/af_unix.h b/include/net/af_unix.h
> >> index f42fdddecd41..a86da0cb5ec1 100644
> >> --- a/include/net/af_unix.h
> >> +++ b/include/net/af_unix.h
> >> @@ -36,7 +36,7 @@ struct unix_skb_parms {
> >>         kgid_t                  gid;
> >>         struct scm_fp_list      *fp;            /* Passed files         */
> >>  #ifdef CONFIG_SECURITY_NETWORK
> >> -       u32                     secid;          /* Security ID          */
> >> +       struct lsmblob          lsmblob;        /* Security LSM data    */
> > As mentioned in a previous revision, I remain concerned that this is
> > going to become a problem due to the size limit on unix_skb_parms.  I
> > would need to redo the math to be certain, but if I recall correctly
> > this would limit us to five LSMs assuming both that we don't need to
> > grow the per-LSM size of lsmblob *and* the netdev folks don't decide
> > to add more fields to the unix_skb_parms.
> >
> > I lost track of that earlier discussion so I'm not sure where it ended
> > up, but if there is a viable alternative it might be a good idea to
> > pursue it.
>
> Stephen had concerns about the lifecycle management involved. He also
> pointed out that I had taken a cowards way out when allocations failed.
> That could result in unexpected behavior when an allocation failed.
> Fixing that would have required a major re-write of the currently simple
> UDS attribute code, which I suspect would be as hard a sell to netdev as
> expanding the secid to a lsmblob. I also thought I'd gotten netdev on the
> CC: for this patch, but it looks like I missed it.
>
> I did start on the UDS attribute re-do, and discovered that I was going
> to have to introduce new failure paths, and that it might not be possible
> to maintain compatibility for all cases because of the new possibilities
> of failure.

... and you're hoping to not be responsible for this code by the time
this becomes a limiting issue? ;)

I understand the concerns you mention, they are all valid as far as
I'm concerned, but I think we are going to get burned by this code as
it currently stands.

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

