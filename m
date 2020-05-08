Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 72A7D1CA115
	for <lists+linux-audit@lfdr.de>; Fri,  8 May 2020 04:52:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1588906362;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=F+rY43UAdrhHSUHHjU9E4ThhDKkx0Z4uU3dNNFkmVtk=;
	b=hB9w8T+BQzBr89SIf4BNWtB6JxeSQnKRhjuhbeUNM8c4/GCK9jGURBOg680wZXEJ1UteG4
	pMb4ZEIhNoEZdH1dwi+6wAzXWgm2o17Z4AAgaffBwPBlzLwdsn81DLWYFNyWGFPaPHKxSV
	f5CUEI2ddGI4w2/iZh+AyGsOGLLi9Dw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-427-ubwfTrphMAKIiCQrM6sj1g-1; Thu, 07 May 2020 22:52:40 -0400
X-MC-Unique: ubwfTrphMAKIiCQrM6sj1g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 10402100CCC0;
	Fri,  8 May 2020 02:52:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DA6855D9CA;
	Fri,  8 May 2020 02:52:33 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 444AF1809543;
	Fri,  8 May 2020 02:52:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0482qRFo013251 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 7 May 2020 22:52:27 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C290E53C2; Fri,  8 May 2020 02:52:27 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BE92811D292
	for <linux-audit@redhat.com>; Fri,  8 May 2020 02:52:24 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B36371859164
	for <linux-audit@redhat.com>; Fri,  8 May 2020 02:52:24 +0000 (UTC)
Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com
	[209.85.218.68]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-206-liTfJwyRPJadHYfbtuFYNA-1; Thu, 07 May 2020 22:52:22 -0400
X-MC-Unique: liTfJwyRPJadHYfbtuFYNA-1
Received: by mail-ej1-f68.google.com with SMTP id re23so115021ejb.4
	for <linux-audit@redhat.com>; Thu, 07 May 2020 19:52:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=I+1cQWgxt1/5EB9HjjZokgUdamjeR9vKZIDzakJvGZg=;
	b=g0wekwve2A2CH8aNqL79ZzWUeL6Ivl1L9WmubhhACoPBi6r1k1Abame/OKJ3I4XlSx
	R9ZHVLq7/mBlq6l+5inpfJz5X2YG1PvkG1wcOIb4mwhd8ba7MfFwCaPCMWSeSZ4Z2Can
	pMZJbCOrqLrFwprOwGs1sm+oeZ6rnhwYh8ynxrpQ6fUWVL97YDKu5yD930DSDDZEhsnS
	bH2gv2P51pCgI5OMgYQf+P0kK6ZV/d8rh6TZpqJTS7XtLUKtdfNYFeKGfrXCONuTtT+P
	gP/+B3dHFgPwGCbyK3Zr8GwRceDKaF3ze2TPzeZV8GdG6Z+Pr2CsK3eJSc597twQPwMK
	KuVA==
X-Gm-Message-State: AGi0PuY0gS9ESNLE8RIUjsJw2NU9fvL3vUuCw+1PicQ9sbgFAlVxI8lD
	TdLqMpjZHrH4xu/CoT7Sc+r03JCHkbYEskQYn+p7
X-Google-Smtp-Source: APiQypIoy6GdXKb146yh6AuN5kdW/00MOaAx9ReHHhW8zKqMsU1nfHRFkS++ItJFML6mGa+GYeDn3Vz0arJiOWV+kKk=
X-Received: by 2002:a17:906:31da:: with SMTP id
	f26mr112797ejf.308.1588906340722; 
	Thu, 07 May 2020 19:52:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200507185041.GA13930@embeddedor>
In-Reply-To: <20200507185041.GA13930@embeddedor>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 7 May 2020 22:52:09 -0400
Message-ID: <CAHC9VhSm_GWWXuzuwrrcTF3QcKCv1WSZv2=WF4t3DB4P7vshoA@mail.gmail.com>
Subject: Re: [PATCH] audit: Replace zero-length array with flexible-array
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0482qRFo013251
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, May 7, 2020 at 2:46 PM Gustavo A. R. Silva
<gustavoars@kernel.org> wrote:
> The current codebase makes use of the zero-length array language
> extension to the C90 standard, but the preferred mechanism to declare
> variable-length types such as these ones is a flexible array member[1][2],
> introduced in C99:
>
> struct foo {
>         int stuff;
>         struct boo array[];
> };
>
> By making use of the mechanism above, we will get a compiler warning
> in case the flexible array does not occur last in the structure, which
> will help us prevent some kind of undefined behavior bugs from being
> inadvertently introduced[3] to the codebase from now on.
>
> Also, notice that, dynamic memory allocations won't be affected by
> this change:
>
> "Flexible array members have incomplete type, and so the sizeof operator
> may not be applied. As a quirk of the original implementation of
> zero-length arrays, sizeof evaluates to zero."[1]
>
> sizeof(flexible-array-member) triggers a warning because flexible array
> members have incomplete type[1]. There are some instances of code in
> which the sizeof operator is being incorrectly/erroneously applied to
> zero-length arrays and the result is zero. Such instances may be hiding
> some bugs. So, this work (flexible-array member conversions) will also
> help to get completely rid of those sorts of issues.
>
> This issue was found with the help of Coccinelle.
>
> [1] https://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html
> [2] https://github.com/KSPP/linux/issues/21
> [3] commit 76497732932f ("cxgb3/l2t: Fix undefined behaviour")
>
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> ---
>  include/linux/audit.h |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Merged into audit/next, thanks!

> diff --git a/include/linux/audit.h b/include/linux/audit.h
> index f9ceae57ca8d..2b63aee6e9fa 100644
> --- a/include/linux/audit.h
> +++ b/include/linux/audit.h
> @@ -19,7 +19,7 @@
>  struct audit_sig_info {
>         uid_t           uid;
>         pid_t           pid;
> -       char            ctx[0];
> +       char            ctx[];
>  };
>
>  struct audit_buffer;

-- 
paul moore
www.paul-moore.com


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

