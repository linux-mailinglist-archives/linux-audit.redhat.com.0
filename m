Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 2F3DFE5093
	for <lists+linux-audit@lfdr.de>; Fri, 25 Oct 2019 17:55:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1572018945;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=TSB+zZOOmYTVTcVunisO7gOjUvf4XjSu++LINtN7XPg=;
	b=bCKqBWOo5y5L7miSpowTA4LVf4y1OEEG8asQqYUn7UP0LMbf/oyb7bPePQISU94N1TTIGM
	AKEe8nyeZzuF01DaRX09V+3Ub90A9wZ6uHMBibG6XtZOWHO+m59b1u2uebcqt0M+Uz8TAY
	URc0wZViCpC8lpSZrvG51lghIqSByvQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-152-I8N6yADYO4-Z-4z4h9Faew-1; Fri, 25 Oct 2019 11:55:41 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2F64D1800DFC;
	Fri, 25 Oct 2019 15:55:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DD9095DC1E;
	Fri, 25 Oct 2019 15:55:33 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 299E618089DC;
	Fri, 25 Oct 2019 15:55:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9PFtE2v010553 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 25 Oct 2019 11:55:14 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D46805D70E; Fri, 25 Oct 2019 15:55:14 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx18.extmail.prod.ext.phx2.redhat.com
	[10.5.110.47])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CF23861F24
	for <linux-audit@redhat.com>; Fri, 25 Oct 2019 15:55:12 +0000 (UTC)
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
	[209.85.167.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C6E51308219E
	for <linux-audit@redhat.com>; Fri, 25 Oct 2019 15:55:11 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id g3so2147534lfb.11
	for <linux-audit@redhat.com>; Fri, 25 Oct 2019 08:55:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=sS3PYP7sb7nZeexvyG7CuYvg14FuVX9+0KxUSPIEzcs=;
	b=iPNbE88wQrefv9FNGFWwMWYIkeByhlN1R2Et7qf0vcqAwAdUfHx7S5EJF7Mx2o3/lz
	XpaPovhzMPBk27T1Ugf0V8JHUbeKM4FkBV36inChxAafBpJvKr7AGH6LHH09Zx5ia/4m
	b8ujaQ2KtogGsZ8ogeR+n4dJuZwsTZWCv+G2KEcR4RRWBU7l4B4DAt7sCIcbEVYpdW98
	k1boRuQ4gplMpZib01mYXM52M0lVVtMMq8Qd8uoGRnhnWZac34WTOHq/oY6ycqike9wx
	/NEvXJps3cXWNcPA4ipFlJ+Do3r8lkT9NKc6GP+yweAmmMvd83/Ih3hk6QbVwsI8GhxH
	WLYA==
X-Gm-Message-State: APjAAAW0Z4+IZmtT5SPBRGMbkSbrel6vdHDC+TnE8d3n1r8pn7H7YPQm
	8Z7Wm8YkONXm1RwqVEIHSD853cldLP0yjlFzZR3R01duew==
X-Google-Smtp-Source: APXvYqynWNcfJAV5BSOoIkWNJbu7fzy1hygZ1L6EWTv9teeMfhYOH+6vtS9qysworxUgBfYNGDL9w7vnEaeLXe2Rst8=
X-Received: by 2002:ac2:51b6:: with SMTP id f22mr3196445lfk.175.1572018910101; 
	Fri, 25 Oct 2019 08:55:10 -0700 (PDT)
MIME-Version: 1.0
References: <7869bb43-5cb1-270a-07d1-31574595e13e@huawei.com>
	<16e0170d878.280e.85c95baa4474aabc7814e68940a78392@paul-moore.com>
	<a700333e-53b8-1a28-b27d-2ba3f612df2a@huawei.com>
In-Reply-To: <a700333e-53b8-1a28-b27d-2ba3f612df2a@huawei.com>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 25 Oct 2019 11:54:58 -0400
Message-ID: <CAHC9VhRfEkPCC-T1W2AOD2FTkUD4Z=BT=R+-kF+=Rejv9fyWOw@mail.gmail.com>
Subject: Re: [PATCH] audit: remove redundant condition check in
	kauditd_thread()
To: Yunfeng Ye <yeyunfeng@huawei.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.47]);
	Fri, 25 Oct 2019 15:55:12 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]);
	Fri, 25 Oct 2019 15:55:12 +0000 (UTC) for IP:'209.85.167.68'
	DOMAIN:'mail-lf1-f68.google.com' HELO:'mail-lf1-f68.google.com'
	FROM:'paul@paul-moore.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_NONE) 209.85.167.68 mail-lf1-f68.google.com 209.85.167.68
	mail-lf1-f68.google.com <paul@paul-moore.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.47
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: linux-audit@redhat.com
Cc: hushiyuan@huawei.com, linfeilong@huawei.com, linux-audit@redhat.com,
	linux-kernel@vger.kernel.org
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: I8N6yADYO4-Z-4z4h9Faew-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 25, 2019 at 3:14 AM Yunfeng Ye <yeyunfeng@huawei.com> wrote:
> On 2019/10/25 13:43, Paul Moore wrote:
> > On October 23, 2019 3:27:50 PM Yunfeng Ye <yeyunfeng@huawei.com> wrote:
> >> Warning is found by the code analysis tool:
> >>  "the condition 'if(ac && rc < 0)' is redundant: ac"
> >>
> >>
> >> The @ac variable has been checked before. It can't be a null pointer
> >> here, so remove the redundant condition check.
> >>
> >>
> >> Signed-off-by: Yunfeng Ye <yeyunfeng@huawei.com>
> >> ---
> >> kernel/audit.c | 4 ++--
> >> 1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > Hello,
> >
> > Thank you for the patch.  Looking quickly at it, it appears to be corre=
ct, unfortunately I'm not in a position to merge non-critical patches, but =
I expect to merge this next week.
> >
> ok, thanks.

I was able to find some time today to take a closer look and it still
looks good to me so I've merge it into audit/next - thanks!

--=20
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

