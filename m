Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id EBE80177E2B
	for <lists+linux-audit@lfdr.de>; Tue,  3 Mar 2020 18:54:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1583258089;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=e9gQokYfueeB3x2AsHpFCjEEg9M/YtLDlBUuPL97eAE=;
	b=gICvritRN4OTc5cb0eoMRQL3g4Sm8UpXAxnc9d1rJCJL+bHv2GPxMO6chLSVi0WItIlMsk
	bSfV7CNQE9BCgmAcUdeNVouHoLw/XWIlf+k1sBMRiA+J3F/EmuXK2Xk4m7RBc2Um/mZXvp
	+EsAxwovYv6YneJuwU3Y+TmWRs6qM+w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-488-PfBfNb1gM_iOgyj-u_DNeg-1; Tue, 03 Mar 2020 12:54:47 -0500
X-MC-Unique: PfBfNb1gM_iOgyj-u_DNeg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3D0F41034B21;
	Tue,  3 Mar 2020 17:54:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B3DAD7386B;
	Tue,  3 Mar 2020 17:54:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7994784499;
	Tue,  3 Mar 2020 17:54:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 023HsTA9008433 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 3 Mar 2020 12:54:29 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 97289F18B1; Tue,  3 Mar 2020 17:54:29 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9366EEB345
	for <linux-audit@redhat.com>; Tue,  3 Mar 2020 17:54:27 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EA5368007A4
	for <linux-audit@redhat.com>; Tue,  3 Mar 2020 17:54:26 +0000 (UTC)
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-374-LuIlICt_M8akWkOa6noO9A-1; Tue, 03 Mar 2020 12:54:22 -0500
X-MC-Unique: LuIlICt_M8akWkOa6noO9A-1
Received: by mail-ed1-f66.google.com with SMTP id t7so5519398edr.4
	for <linux-audit@redhat.com>; Tue, 03 Mar 2020 09:54:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=a5oj7930ivoMz1yrKWWpyZBMcoKwM+Ije9UznOJqhpU=;
	b=c0jL+P2ZJ02sd8bHggH+T6H8wBxYizCVhjrtQy3UD3CJ3W/3PPlLcVdMJ+xBUte+mE
	gD9axQ1pOsNp6IeQ69dN5mzfUMoxRZFYtGSEhL9hMYuCockbuafpnNplFUcWKjulgBMD
	rPyTmi0YXyP0wptTEKIeEkMQBLyjGVvziOJrwHZPFvz9KQvZPTOIrXCCNpBJi86ImsfW
	/lx8rO9guqiQDNKzJRjMWo/k0q9o150SLeSt18qWkjeQrN0OpIrUgtH3gPKmWQnKnf2v
	CHrlblAxVqbQ/ZOwUqfft6RwpigZX4Pa3TOXeMfELX8EEHJdh3EzatYC6oHhYu+hgtde
	OmrA==
X-Gm-Message-State: ANhLgQ1x/6FMJIFZZDhU2KAm7AL0s/hQdh3SPrIjrz6bWOk2ezccrcpp
	HCav4oF+UNEA8F4ICzEFpeNnH6X9v/cNBZplWbJz4ys=
X-Google-Smtp-Source: ADFU+vsIJ+Hi+cMN8VgdTwU6Bh9oTR9yOB9vOzHnOIOKRp80h1O4mXh8TnX9d4yb33ReWY+IOHzzsg2S2wYch61rR4g=
X-Received: by 2002:a17:906:6bcf:: with SMTP id
	t15mr5002937ejs.95.1583258060449; 
	Tue, 03 Mar 2020 09:54:20 -0800 (PST)
MIME-Version: 1.0
References: <20200222000407.110158-1-casey.ref@schaufler-ca.com>
	<20200222000407.110158-1-casey@schaufler-ca.com>
	<853ac380-2132-febe-fda0-ff0a0a74d480@schaufler-ca.com>
	<658202b8-c257-e74f-1769-af40cb2325ab@schaufler-ca.com>
In-Reply-To: <658202b8-c257-e74f-1769-af40cb2325ab@schaufler-ca.com>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 3 Mar 2020 12:54:09 -0500
Message-ID: <CAHC9VhRVhza1wJzkxaFvJuwjifHrf_8PMuPtatkrnpWGczc6vQ@mail.gmail.com>
Subject: Re: [PATCH v15 00/23] LSM: Module stacking for AppArmor
To: Casey Schaufler <casey@schaufler-ca.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 023HsTA9008433
X-loop: linux-audit@redhat.com
Cc: casey.schaufler@intel.com, Richard Guy Briggs <rgb@redhat.com>,
	linux-audit@redhat.com, James Morris <jmorris@namei.org>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Mar 3, 2020 at 12:22 PM Casey Schaufler <casey@schaufler-ca.com> wrote:
> On 2/27/2020 9:29 AM, Casey Schaufler wrote:
> > On 2/21/2020 4:03 PM, Casey Schaufler wrote:
> >> Resending the audit related patches to the audit list,
> >> as there have been problems with the CC lists.
> > There's an awful lot of interaction between the module stacking
> > and the audit sub-system. I have not gotten much feedback about
> > the audit changes recently, but I can't bring myself to think
> > this means there aren't any concerns. Before I start pushing for
> > the stacking to get pulled I would really appreciate either ACKs
> > or meaningful comments from the audit community. I can see that
> > there's a lot going on in the audit sub-system, and appreciate
> > that priorities may be elsewhere.
> >
> > Thank you.
>
> I have to start pushing on this series. If the audit community
> hasn't any additional feedback, I'll take it that what's here is
> acceptable and move my lobbying efforts elsewhere.

I'll take another look later this week.

-- 
paul moore
www.paul-moore.com


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

