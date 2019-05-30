Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A95B302E4
	for <lists+linux-audit@lfdr.de>; Thu, 30 May 2019 21:39:18 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 89BCB9FFEE;
	Thu, 30 May 2019 19:39:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D304E18774;
	Thu, 30 May 2019 19:39:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 13DC118433A1;
	Thu, 30 May 2019 19:39:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4UJcJAH028389 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 30 May 2019 15:38:19 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 651FC7E328; Thu, 30 May 2019 19:38:19 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.41])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 605337E31B
	for <linux-audit@redhat.com>; Thu, 30 May 2019 19:38:16 +0000 (UTC)
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
	[209.85.167.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DDB763179B57
	for <linux-audit@redhat.com>; Thu, 30 May 2019 19:37:59 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id m15so5954686lfh.4
	for <linux-audit@redhat.com>; Thu, 30 May 2019 12:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=e0nvDnxDgD/47T23GkTZWZTSunzmWHztJ2WsIBo9EBI=;
	b=ihqCYCECowlyhwJvP8Y2Z1/XU+E9p0g5IIJbmBK1dKcWtJfXEu5alRt49ZY4O3GKcx
	3i2DN0724eXLfVSYYqRm58fI2OMt2HAQ2KSWLZZ/QoTOee2B3gpocHwxoLyv4EI0W/1Z
	8yJOMYXq0gz/8mSE2LCY1q52ksJICtTJFke+RQFZxjdCsbixcJebVFpy7DKMY8ayDcP7
	cixZqDorKM6eYcydm0J2/JerQ18lBcQJ4aEwETF75ymgDXhdDKY+HCXVOOA80gxhDc5c
	7x5D+c0FqxF3JVTdLwKGyIHBrmI0viUqYlwZf4CB90Htq9NGhoz3VcksgZYfpMtb3+s+
	nkeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=e0nvDnxDgD/47T23GkTZWZTSunzmWHztJ2WsIBo9EBI=;
	b=WikpIVJGX/vdckpQkiqdbd9BoNLXWyE9GSEvTHvgjXHu7kUwtIVtJ+FcqcbvoxVHnN
	a4YBvZ70SuC+K3B2z61klcSa+jyk2XnbncsQTtJSW90iZQiQ8indSnWm4qNnAtAkm0lS
	QUw0ivIc4Jd3PZV6lAGQgKyOfy9TechBheU+Hv3wqjIIWFyYTx+My/1/uJf2Z2NCmVA3
	HVqiWrHnKB6+GWE2Wc9LR3CGewBoV1QBl70dz/mLXadf3zOgUuVPee5nSpNS6nXEsk9n
	Ny5qyGbNdOp3QOJVR2M6SXasBRFJYv0IiMc0gP5iifCRxL6V2OEeEov2S0BxRPzVsMqE
	oNXQ==
X-Gm-Message-State: APjAAAXDSgvFvJu7enPxlBd7aYyBGR/3dSmd+Hyxa7PNgi16UGW7RFWU
	kb2ByXXqijsq0pF7RP11I7P15DWIIiY3/OGA5OY6sXA=
X-Google-Smtp-Source: APXvYqwVxacsJvopUVD2cqD66Nt++dGno/0AUPlsFc+/DtUvElOZAkGA5g0YNf3yH70fcLIBtsWUnFliEbTf/Fhmp5M=
X-Received: by 2002:ac2:410a:: with SMTP id b10mr3004473lfi.175.1559245078190; 
	Thu, 30 May 2019 12:37:58 -0700 (PDT)
MIME-Version: 1.0
References: <155923533113.12169.6169677957008313366.stgit@chester>
	<20190530193351.dk52og5s5xgnlzul@madcap2.tricolour.ca>
In-Reply-To: <20190530193351.dk52og5s5xgnlzul@madcap2.tricolour.ca>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 30 May 2019 15:37:47 -0400
Message-ID: <CAHC9VhSrbR=svc9Sn=KBrECPsCvH5vCkBeP2dj4-uE-9c6jtyQ@mail.gmail.com>
Subject: Re: [PATCH] audit: remove the BUG() calls in the audit rule
	comparison functions
To: Richard Guy Briggs <rgb@redhat.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.41]);
	Thu, 30 May 2019 19:38:05 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]);
	Thu, 30 May 2019 19:38:05 +0000 (UTC) for IP:'209.85.167.66'
	DOMAIN:'mail-lf1-f66.google.com' HELO:'mail-lf1-f66.google.com'
	FROM:'paul@paul-moore.com' RCPT:''
X-RedHat-Spam-Score: -0.009  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE) 209.85.167.66 mail-lf1-f66.google.com
	209.85.167.66 mail-lf1-f66.google.com <paul@paul-moore.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.41
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: linux-audit@redhat.com
Cc: linux-audit@redhat.com
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]); Thu, 30 May 2019 19:39:17 +0000 (UTC)

On Thu, May 30, 2019 at 3:34 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> On 2019-05-30 12:55, Paul Moore wrote:
> > The audit_data_to_entry() function ensures that the operator is valid
> > so we can get rid of these BUG() calls.  We keep the "return 0" just
> > so the system behaves in a sane-ish manner should something go
> > horribly wrong.
> >
> > Signed-off-by: Paul Moore <paul@paul-moore.com>
>
> Acked-by: Richard Guy Briggs <rgb@redhat.com>

Merged into audit/next.

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
