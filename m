Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 93F3F2A3B11
	for <lists+linux-audit@lfdr.de>; Tue,  3 Nov 2020 04:31:57 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-85-Dy96yCW_MlGX3wD0bUkuHg-1; Mon, 02 Nov 2020 22:31:53 -0500
X-MC-Unique: Dy96yCW_MlGX3wD0bUkuHg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4597F1006CA1;
	Tue,  3 Nov 2020 03:31:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 35B2C5C22A;
	Tue,  3 Nov 2020 03:31:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 01CAC44A6B;
	Tue,  3 Nov 2020 03:31:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0A33VTUg016346 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 2 Nov 2020 22:31:29 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id AB9132144B32; Tue,  3 Nov 2020 03:31:29 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A6DE82144B30
	for <linux-audit@redhat.com>; Tue,  3 Nov 2020 03:31:26 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8E5CE185A790
	for <linux-audit@redhat.com>; Tue,  3 Nov 2020 03:31:26 +0000 (UTC)
Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com
	[209.85.218.68]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-416--6z2DkT9Oe-PBW86tQiJ9g-1; Mon, 02 Nov 2020 22:31:24 -0500
X-MC-Unique: -6z2DkT9Oe-PBW86tQiJ9g-1
Received: by mail-ej1-f68.google.com with SMTP id gn41so4822403ejc.4
	for <linux-audit@redhat.com>; Mon, 02 Nov 2020 19:31:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=LCteMuWwpHEs2XDzcbS6n1Kpov9xOs3oNYDkQ8D8nFQ=;
	b=frqCMahMMr17/f7NHEgPObxEiCLJRAc9Fz/u2m2TccHD3lAw6vKyxkbZyIVkpsF9B9
	mWw/7xoxQNqoh+X+j8Y3C+n/N20mlWvNs0ihFnvCKZDXB/cBL2xDqmk6k9C5nijTza1R
	R8O2Hl142YES0UvLjfrgQK1Csst86JOpbTYh2rKJdpjMtTNW3g6T9yLDgcWaZ6grnxVu
	ql0AHlaAPJbHyi25htoSMkrsEgN5DoahljB5kOQG4jmgREX5mK0iuAgknxt4xeFRK0LA
	+Aw7a8CHol0JLPB4lx8RQ86XflK3tTc6mOfTmDb8XerZh6IHZO3fnaszPMF+gSCfauOy
	1dEg==
X-Gm-Message-State: AOAM533Rot6VMFB6tvetAKdQ2460T9FpyL579fQ72l2z66dijoXBEt8w
	Lf3LYyBsXg60S5GSU541jO9tvL3ldaCeB88PyO4p
X-Google-Smtp-Source: ABdhPJycuR2cflK57G6svWo0stHsdjEhPseRN+Ni64+Ddd84lQ4xBMbVMxy/ZR6g4ExC9Y3uEL+gzLwzHTy14cKqX1w=
X-Received: by 2002:a17:906:3b81:: with SMTP id
	u1mr11137809ejf.542.1604374282696; 
	Mon, 02 Nov 2020 19:31:22 -0800 (PST)
MIME-Version: 1.0
References: <e4bf30e2-a92f-99b7-30d0-3e3473e30399.ref@schaufler-ca.com>
	<e4bf30e2-a92f-99b7-30d0-3e3473e30399@schaufler-ca.com>
	<20201102220834.GD55072@madcap2.tricolour.ca>
	<6c950188-a516-e9ed-caa5-42de40861596@schaufler-ca.com>
	<20201103011925.GF55072@madcap2.tricolour.ca>
In-Reply-To: <20201103011925.GF55072@madcap2.tricolour.ca>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 2 Nov 2020 22:31:11 -0500
Message-ID: <CAHC9VhS9vyNj_ygkWFQssFb3FDoQ3C1dekiFEFXMgTCOL1bqLg@mail.gmail.com>
Subject: Re: [RFC PATCH] audit-testsuite: tests for subject and object
	correctness
To: Richard Guy Briggs <rgb@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-audit@redhat.com
Cc: "linux-audit@redhat.com" <linux-audit@redhat.com>
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Nov 2, 2020 at 8:19 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> On 2020-11-02 14:51, Casey Schaufler wrote:
> > On 11/2/2020 2:08 PM, Richard Guy Briggs wrote:
> > > On 2020-11-02 13:54, Casey Schaufler wrote:
> > >> Verify that there are subj= and obj= fields in a record
> > >> if and only if they are expected. A system without a security
> > >> module that provides these fields should not include them.
> > >> A system with multiple security modules providing these fields
> > >> (e.g. SELinux and AppArmor) should always provide "?" for the
> > >> data and also include a AUDIT_MAC_TASK_CONTEXTS or
> > >> AUDIT_MAC_OBJ_CONTEXTS record. The test uses the LSM list from
> > >> /sys/kernel/security/lsm to determine which format is expected.
> > >>
> > >> Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
> > >> ---
> > >>  tests/Makefile                   |   1 +
> > >>  tests/multiple_contexts/Makefile |  12 +++
> > >>  tests/multiple_contexts/test     | 166 +++++++++++++++++++++++++++++++
> > >>  3 files changed, 179 insertions(+)
> > >>  create mode 100644 tests/multiple_contexts/Makefile
> > >>  create mode 100755 tests/multiple_contexts/test
> > >>
> > >> diff --git a/tests/Makefile b/tests/Makefile
> > >> index a7f242a..f20f6b1 100644
> > >> --- a/tests/Makefile
> > >> +++ b/tests/Makefile
> > >> @@ -18,6 +18,7 @@ TESTS := \
> > >>    file_create \
> > >>    file_delete \
> > >>    file_rename \
> > >> +  multiple_contexts \
> > > "context" is a bit ambiguous.  Could this be named something to indicate
> > > a security context rather than any other sort, such as audit or user
> > > context?
> >
> > Would "subj_obj_fields" be better?
>
> That is much more obvious to me.  Maybe even sec_context_multi, but I
> like your suggestion better?

How about just "multiple_lsms"?  It's relatively concise and better
reflects what it is actually being tested IMHO.

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

