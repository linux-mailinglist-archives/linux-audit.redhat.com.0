Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D403347A
	for <lists+linux-audit@lfdr.de>; Mon,  3 Jun 2019 18:04:05 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E353F308FEC4;
	Mon,  3 Jun 2019 16:03:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 324B560BFB;
	Mon,  3 Jun 2019 16:03:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 351DA206D4;
	Mon,  3 Jun 2019 16:02:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x53G1sbc014557 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 3 Jun 2019 12:01:54 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E1A56604FE; Mon,  3 Jun 2019 16:01:54 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D9D02605CF
	for <linux-audit@redhat.com>; Mon,  3 Jun 2019 16:01:52 +0000 (UTC)
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
	[209.85.167.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 13B508110C
	for <linux-audit@redhat.com>; Mon,  3 Jun 2019 16:01:37 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id y13so14008928lfh.9
	for <linux-audit@redhat.com>; Mon, 03 Jun 2019 09:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=wwAb+fjZakb4SE3XBU2vDo+/FsY9YcZ27a86p6XEaAs=;
	b=RAknaK6HJEQ5zkQCebN0zIeweiFarG87mqZWgTXpU/mJYEt/DEie3H3GUrpMAkizhf
	DAjrek0lkfPev895ypNRKOioKwTHoHppJhQCGVAq+NcSFX9QQKad4aQE4NgXUszbotod
	HpqE5XLtyZaVR5/qdNcdgb7ceGwsUQvR666euqtSsqc3OmniQ2styCZ5A6fa8wFzmYab
	XQWs/R8Zv9uWMeeBYycMepmlBwpgKHulJsqz5096zetgsMifJSoInjVF+zauJ7Lcd+ZK
	poQFphqqutbXYOSTji0TJpFkZiZboByLaWGvrwJDqBIG4csRSA2uepIebTq5Rhzk3wDG
	LSOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=wwAb+fjZakb4SE3XBU2vDo+/FsY9YcZ27a86p6XEaAs=;
	b=Q9xemCX8JUFsd/dx5mhAt9RIH+So+Wa5r8UN5Mn4/kWyckgU9QajhyGzuFYuz4xJ0W
	NlNLq29ay5GVKjkdI99JLq0w44P4YECKgXpzjpSB279ttrh4O5YkQdrdulbE4FPOA0Q6
	6eKr44A9vJjzSEA1xbe7IuRC8CyVh4NMUe+jgtOtXgFmTS0+YRi2HqDVxCLQzNQxMHTw
	LTgzu7js5+fI0XInyMwBRjS9cNH8EhnODpOAF6g/iJQolUdXakP9l94/OcmDAg2PIUMW
	Vb5CjK8XQ/g28XMhIrGOwKHnxCT6XCfuoZqKexAg2/Zr49ISFhwVip6IXtKygJSbVIda
	4G5Q==
X-Gm-Message-State: APjAAAUao4bChW0ipM/b8FiXRCsLZn1UQZ/fIxBBpL3SwcLEO5q+q/hn
	Q9+XVuW4H3oqzV6WMfquOzEu2nQiVYItI4UD+6+zk/k=
X-Google-Smtp-Source: APXvYqzF84jTm/2bsJE8Z7872PStSoK3LKry51awtLL9AllXtZ9eS6eWxt9+Bys/+Qo1UsfILlV7LgRg51RsyxVhV98=
X-Received: by 2002:ac2:446b:: with SMTP id y11mr9514878lfl.158.1559577695379; 
	Mon, 03 Jun 2019 09:01:35 -0700 (PDT)
MIME-Version: 1.0
References: <fadb320e38a899441fcc693bbbc822a3b57f1a46.1559239558.git.rgb@redhat.com>
In-Reply-To: <fadb320e38a899441fcc693bbbc822a3b57f1a46.1559239558.git.rgb@redhat.com>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 3 Jun 2019 12:01:24 -0400
Message-ID: <CAHC9VhQZuOXiK4yj4xeRwGF_qepeg7qDL02GDdYhwTNRLRdmPA@mail.gmail.com>
Subject: Re: [PATCH ghak90 V6] fixup! audit: add containerid filtering
To: Richard Guy Briggs <rgb@redhat.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Mon, 03 Jun 2019 16:01:37 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]);
	Mon, 03 Jun 2019 16:01:37 +0000 (UTC) for IP:'209.85.167.66'
	DOMAIN:'mail-lf1-f66.google.com' HELO:'mail-lf1-f66.google.com'
	FROM:'paul@paul-moore.com' RCPT:''
X-RedHat-Spam-Score: -0.604  (DKIM_INVALID, DKIM_SIGNED, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,
	SPF_NONE) 209.85.167.66 mail-lf1-f66.google.com 209.85.167.66
	mail-lf1-f66.google.com <paul@paul-moore.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.28
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: linux-audit@redhat.com
Cc: nhorman@tuxdriver.com, linux-api@vger.kernel.org,
	containers@lists.linux-foundation.org,
	LKML <linux-kernel@vger.kernel.org>, dhowells@redhat.com,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	netfilter-devel@vger.kernel.org, ebiederm@xmission.com,
	simo@redhat.com, netdev@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Eric Paris <eparis@parisplace.org>, Serge Hallyn <serge@hallyn.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]); Mon, 03 Jun 2019 16:03:59 +0000 (UTC)

On Fri, May 31, 2019 at 1:54 PM Richard Guy Briggs <rgb@redhat.com> wrote:
>
> Remove the BUG() call since we will never have an invalid op value as
> audit_data_to_entry()/audit_to_op() ensure that the op value is a a
> known good value.
>
> Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> ---
>  kernel/auditfilter.c | 1 -
>  1 file changed, 1 deletion(-)

Thanks for sending this out.  However, in light of the discussion in
the patchset's cover letter it looks like we need to better support
nested container orchestrators which is likely going to require some
non-trivial changes to the kernel/userspace API.  Because of this I'm
going to hold off pulling these patches into a "working" branch,
hopefully the next revision of these patches will solve the nested
orchestrator issue enough that we can continue to move forward with
testing.

> diff --git a/kernel/auditfilter.c b/kernel/auditfilter.c
> index 407b5bb3b4c6..385a114a1254 100644
> --- a/kernel/auditfilter.c
> +++ b/kernel/auditfilter.c
> @@ -1244,7 +1244,6 @@ int audit_comparator64(u64 left, u32 op, u64 right)
>         case Audit_bittest:
>                 return ((left & right) == right);
>         default:
> -               BUG();
>                 return 0;
>         }
>  }
> --
> 1.8.3.1
>


-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
