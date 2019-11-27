Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 3D48310CA5F
	for <lists+linux-audit@lfdr.de>; Thu, 28 Nov 2019 15:30:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1574951443;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=iXyVQWCLTuzw3qqAG/FUoDNMY2KXW685kh2IsFAXdbA=;
	b=QvlX+mUacO2U9JIbNrL4vZ/Gu0IsW42Ws10AK41+9k6xf/Xxt3+Xvof2Rpi7yT9VWBkgnB
	Vf5Ml2FRdf9zeVGJKNRJSp2iSWDI61iutEVKQ2KdrSaPcYn0vG3QicCCsscbmkngQRWZnz
	bP8fuyCNWdyqfIWWoBTMSsoSlq7Scbs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-333-j4GOvugjMze4fXaSHktb2A-1; Thu, 28 Nov 2019 09:30:42 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A2AF29124D;
	Thu, 28 Nov 2019 14:30:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EE158600D1;
	Thu, 28 Nov 2019 14:30:34 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A484B4A460;
	Thu, 28 Nov 2019 14:30:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xAR2TZMs005475 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 26 Nov 2019 21:29:35 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 4836CF84E5; Wed, 27 Nov 2019 02:29:35 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 42DD3C68FE
	for <linux-audit@redhat.com>; Wed, 27 Nov 2019 02:29:33 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0D3308F251B
	for <linux-audit@redhat.com>; Wed, 27 Nov 2019 02:29:33 +0000 (UTC)
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-145-vbkBw-s5Miib0f_kyns7rQ-1; Tue, 26 Nov 2019 21:29:28 -0500
Received: by mail-pf1-f193.google.com with SMTP id i187so6013069pfc.7
	for <linux-audit@redhat.com>; Tue, 26 Nov 2019 18:29:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=NN2NK4AVnHEIbvB9lst01l+3zKuPHZoMQF6S334Sv9g=;
	b=ajAsqIhXWpK1CjoauEwyzbNklKM/ktmyZ68c6+Synh0+Jk0nY/MQtVGvZo6hSY89s5
	1kDK1ZRPRZ1nOdURJDj0xOCMB4Y57XUYA7eOEHWQ8yfLztotRJVobUAgAu71WAv9kTW+
	U2Wlp7Ln+sfX9t5uY2mAZ9VnYvPT9UIi0fqrl4vkAnlKuuEaKbTUXE1Dpg/wghEcUGsR
	bAb7RDS+iCC7SRvdKZC7CVrB7rsTF5cII8NThuog/6j+Hs2Ujty+6ornZvgNnMLO1Na7
	LF8oHR8vqb230uscYTtNYmAKlmQNeAukBaCjErvUFPIRZAfh5SoTwoeYZMaJmA2nXAja
	MsOA==
X-Gm-Message-State: APjAAAX2tjpSTe9dJKq7wdL3X76EpSul/A43D1arO4XzhUoZGdYeSLXl
	9NcFeBWv0zHTwTOx9zMHT6L7/Q==
X-Google-Smtp-Source: APXvYqx+HX61yjud9fIbZqiRcxDpx9y0e6bR1uba8VJ+HnNyYomcwswg1BHVEDSvG74B2G9ilx7NIQ==
X-Received: by 2002:a63:770c:: with SMTP id s12mr2129673pgc.25.1574821767441; 
	Tue, 26 Nov 2019 18:29:27 -0800 (PST)
Received: from localhost ([2620:15c:6:12:9c46:e0da:efbf:69cc])
	by smtp.gmail.com with ESMTPSA id u7sm4370989pjx.19.2019.11.26.18.29.26
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 26 Nov 2019 18:29:26 -0800 (PST)
Date: Tue, 26 Nov 2019 21:29:25 -0500
From: Joel Fernandes <joel@joelfernandes.org>
To: Amol Grover <frextrite@gmail.com>
Subject: Re: [PATCH] kernel: audit.c: Add __rcu notation to RCU pointer
Message-ID: <20191127022925.GB157739@google.com>
References: <20191126172723.GA12759@workstation-kernel-dev>
MIME-Version: 1.0
In-Reply-To: <20191126172723.GA12759@workstation-kernel-dev>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-MC-Unique: vbkBw-s5Miib0f_kyns7rQ-1
X-MC-Unique: j4GOvugjMze4fXaSHktb2A-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xAR2TZMs005475
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Thu, 28 Nov 2019 09:30:15 -0500
Cc: linux-kernel@vger.kernel.org, linux-audit@redhat.com,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-kernel-mentees@lists.linuxfoundation.org
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Tue, Nov 26, 2019 at 10:57:23PM +0530, Amol Grover wrote:
> add __rcu notation to RCU protected global pointer auditd_conn
> 
> Fixes multiple instances of sparse error:
> error: incompatible types in comparison expression
> (different address spaces)
> 
> Signed-off-by: Amol Grover <frextrite@gmail.com>
> ---
>  kernel/audit.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/kernel/audit.c b/kernel/audit.c
> index da8dc0db5bd3..30e7fc9b8da2 100644
> --- a/kernel/audit.c
> +++ b/kernel/audit.c
> @@ -102,12 +102,14 @@ struct audit_net {
>   * This struct is RCU protected; you must either hold the RCU lock for reading
>   * or the associated spinlock for writing.
>   */
> -static struct auditd_connection {
> +struct auditd_connection {
>  	struct pid *pid;
>  	u32 portid;
>  	struct net *net;
>  	struct rcu_head rcu;
> -} *auditd_conn = NULL;
> +};
> +static struct auditd_connection __rcu *auditd_conn;
> +RCU_INIT_POINTER(auditd_conn);

Looks like this causes a build error. Always please build test your patches
in the very least. And I also did not understand how RCU_INIT_POINTER can
even be used outside of a function. In C, executable code cannot be outside
functions.

Is doing the following not sufficient to fix the sparse issue?

thanks,

 - Joel

---8<-----------------------

diff --git a/kernel/audit.c b/kernel/audit.c
index 49b6049b26ac..c5d4b5a2dea1 100644
--- a/kernel/audit.c
+++ b/kernel/audit.c
@@ -108,8 +108,8 @@ struct auditd_connection {
 	struct net *net;
 	struct rcu_head rcu;
 };
-static struct auditd_connection __rcu *auditd_conn;
-RCU_INIT_POINTER(auditd_conn);
+static struct auditd_connection __rcu *auditd_conn = NULL;
+
 static DEFINE_SPINLOCK(auditd_conn_lock);
 
 /* If audit_rate_limit is non-zero, limit the rate of sending audit records


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

