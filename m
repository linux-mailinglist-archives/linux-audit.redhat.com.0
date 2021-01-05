Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 3791D2EA191
	for <lists+linux-audit@lfdr.de>; Tue,  5 Jan 2021 01:46:11 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-505-55m6vGqYPPK5v0EhZbTmCA-1; Mon, 04 Jan 2021 19:46:08 -0500
X-MC-Unique: 55m6vGqYPPK5v0EhZbTmCA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 430AA1081B54;
	Tue,  5 Jan 2021 00:46:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 31DD627C47;
	Tue,  5 Jan 2021 00:45:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 183C24A7C6;
	Tue,  5 Jan 2021 00:45:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1050jdSp024904 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 4 Jan 2021 19:45:39 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id A46552166B2A; Tue,  5 Jan 2021 00:45:39 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9F8792166B29
	for <linux-audit@redhat.com>; Tue,  5 Jan 2021 00:45:37 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 22ECE800198
	for <linux-audit@redhat.com>; Tue,  5 Jan 2021 00:45:37 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
	[209.85.218.44]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-158-dR_yU2zhOFqFv5EgCxBn-g-1; Mon, 04 Jan 2021 19:45:34 -0500
X-MC-Unique: dR_yU2zhOFqFv5EgCxBn-g-1
Received: by mail-ej1-f44.google.com with SMTP id 6so39150153ejz.5
	for <linux-audit@redhat.com>; Mon, 04 Jan 2021 16:45:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=IyfJI4dtsxKeArXoeXBuITYdX7obBLwz+aJmFnS2pHM=;
	b=E0P3WP+34i3cd9xe0Ta+O0NzMuJfMsHSXZlGQEa63imrBXkL8LfNLQ41xgfl+xd+1u
	CVqrW7cVu2STLgjfuDZ1MdAH0IpXG7+RZr9WecXhjCyuegAKdpqWNp2hdIhjxIBnxf1s
	b42QCaP4NsdWf+lgpHahVnCxOVr+0d3F3D3yWHvYshj95RqYqzko/ps+bzGoiJVGOQnr
	JDqykUmAQdKHXkOwfwemzU60ETsdctD8HcY4kztTAmSYRvQAc3QHL51MuTwisklKe0j1
	e/+D3HyJbgqQ/E8RNhQCIAJCQML86YTjem6sGHNtkKYD3BJazEzPjYRNx5592fCepMb8
	XG/w==
X-Gm-Message-State: AOAM531dNO5WliF8wnopdHhMRZ6vU7gxA80VN55f/BhQBSBeFoITA5Ru
	VU1Bcrntm7XJ0tr9Pm/VOjAXLweVKCfE94Zhzx5D
X-Google-Smtp-Source: ABdhPJy7SZ7PohnHD5ePcszn2EXBc+UMBN5ZIumng4b1dP5Kx/luaYQk9zl65YJyS2HZ8nOihZv87LflCX3sg/+nDFw=
X-Received: by 2002:a17:907:700c:: with SMTP id
	wr12mr67410887ejb.398.1609807533402; 
	Mon, 04 Jan 2021 16:45:33 -0800 (PST)
MIME-Version: 1.0
References: <20201211084254.2038-1-zhengyongjun3@huawei.com>
	<20201211153321.GF2015948@madcap2.tricolour.ca>
	<CAHC9VhS9zCzWLhwE=6AOr7sO-LUdLDS6sb4tC2tDuT=LRYdzHw@mail.gmail.com>
In-Reply-To: <CAHC9VhS9zCzWLhwE=6AOr7sO-LUdLDS6sb4tC2tDuT=LRYdzHw@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 4 Jan 2021 19:45:22 -0500
Message-ID: <CAHC9VhTDZiPZ0h-51S-RS2cbT4HPhe=1JhzoqTZAdAhdJCa9Ag@mail.gmail.com>
Subject: Re: [PATCH -next] kernel/audit: convert comma to semicolon
To: Zheng Yongjun <zhengyongjun3@huawei.com>,
	Richard Guy Briggs <rgb@redhat.com>
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
Cc: linux-audit@redhat.com, linux-kernel@vger.kernel.org
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Dec 14, 2020 at 9:34 PM Paul Moore <paul@paul-moore.com> wrote:
> On Fri, Dec 11, 2020 at 10:33 AM Richard Guy Briggs <rgb@redhat.com> wrote:
> > On 2020-12-11 16:42, Zheng Yongjun wrote:
> > > Replace a comma between expression statements by a semicolon.
> > >
> > > Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>
> > > ---
> > >  kernel/audit.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/kernel/audit.c b/kernel/audit.c
> > > index 68cee3bc8cfe..c8497115be35 100644
> > > --- a/kernel/audit.c
> > > +++ b/kernel/audit.c
> > > @@ -2282,7 +2282,7 @@ static void audit_log_set_loginuid(kuid_t koldloginuid, kuid_t kloginuid,
> > >
> > >       uid = from_kuid(&init_user_ns, task_uid(current));
> > >       oldloginuid = from_kuid(&init_user_ns, koldloginuid);
> > > -     loginuid = from_kuid(&init_user_ns, kloginuid),
> > > +     loginuid = from_kuid(&init_user_ns, kloginuid);
> >
> > Nice catch.  That went unnoticed through 3 patches, the last two mine...
>
> Yes, thanks for catching this and submitting a patch.  However, as it
> came very late in the v5.10-rcX release cycle I'm going to wait until
> after this merge window to merge it into audit/next.

This should be in audit/next now, thanks!

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

