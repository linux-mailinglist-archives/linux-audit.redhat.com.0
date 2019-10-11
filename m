Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 398AED3639
	for <lists+linux-audit@lfdr.de>; Fri, 11 Oct 2019 02:39:44 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9E50E83F3D;
	Fri, 11 Oct 2019 00:39:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7893D5D6C8;
	Fri, 11 Oct 2019 00:39:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 39FC84A486;
	Fri, 11 Oct 2019 00:39:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9B0dcLd028809 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 10 Oct 2019 20:39:38 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D25FC1001B08; Fri, 11 Oct 2019 00:39:38 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.43])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CCDFE1001956
	for <linux-audit@redhat.com>; Fri, 11 Oct 2019 00:39:36 +0000 (UTC)
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 500A73090FE0
	for <linux-audit@redhat.com>; Fri, 11 Oct 2019 00:39:34 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id f5so8045868ljg.8
	for <linux-audit@redhat.com>; Thu, 10 Oct 2019 17:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=hNUOlKgtAsIE5sVaiGZXUcvdRA2PQ04IbA6oz24c6V8=;
	b=iP81mvJ6NRHztHSh53vzlkBNXKSKrdUZFa4QghmB7J5WhFdcG7DP8odULQ1+LossNA
	HyY0EtjSe+2D65p1cF1RolTRImCUmAhtf34UnnJiv5bb4byWcyiu0rvjrmfl2vbW40+K
	uYDLMHcrUwNLTf4ZMgF+AbSbAFzYG0VlkyZVjWslSX3CfO8wHTZpCXr6615M3Yfpj4l0
	8f2g26wlubWzyKR8Pe5U+v+67VdFF5Q1pQ0ct6gdTXUOBEg2ZBgOPL9yrMl6iozvVkf1
	p+2xg2upTdzGk4pdFz6YYWPnDIYnEiY4bZ7ccwy25bJtoqymfHPpN9PGVFPFLhREQFOY
	jCcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=hNUOlKgtAsIE5sVaiGZXUcvdRA2PQ04IbA6oz24c6V8=;
	b=QDTUE3c2nr/9AVxMavjUDrqbWnUwd2NIsN+r2vwu2Mnd3YwDIEGddYGyh/OsZWBLYS
	3ay9Lc6U6fYJaf/pGuVs3N0kfpPwp+BNoRciTXmS99O3VT0TkuQgKisvXBGf3vtnTCF4
	YdueqIq6ZvsgIoAPklh+Yu8BhkzhlyNjPx7jBLbs29LanHlfD4zu+Li9jfQyJwst8MVR
	08A0o+T/4qkTpwCzTZ6Ut9VddChbZHVcI53X+dFRpZkcUlD2Kk8QSH+CuvmNLMTnLz37
	zNCU0umii7Nop0+7Sk4VyE3OS2Z2hWzmppqlT2sNrfNMK1mkgUA4njHZlAOlf2c7wLFo
	/BNA==
X-Gm-Message-State: APjAAAU8ApO099zISgIGaSdA0ysqrBRzgPThcDDj8FNf/XcccZktt/U4
	o3y8pq4Wq67P5utMDyYN9mNHgQah1mJklTJtznoP
X-Google-Smtp-Source: APXvYqwpaPJtcZV1PwuU4AeNVWnL9+Nw3+LElDHT8e77zerC7lPTAOUcw5b4UEWy9HlrwEw0xG4KWIzRTp7isyiM8F8=
X-Received: by 2002:a2e:6e18:: with SMTP id j24mr1202454ljc.57.1570754372500; 
	Thu, 10 Oct 2019 17:39:32 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1568834524.git.rgb@redhat.com>
	<0850eaa785e2ff30c8c4818fd53e9544b34ed884.1568834524.git.rgb@redhat.com>
In-Reply-To: <0850eaa785e2ff30c8c4818fd53e9544b34ed884.1568834524.git.rgb@redhat.com>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 10 Oct 2019 20:39:21 -0400
Message-ID: <CAHC9VhQoFFaQACbV4QHG_NPUCJu1+V=x3=i-yyGjbsYq8HuPtg@mail.gmail.com>
Subject: Re: [PATCH ghak90 V7 08/21] audit: add contid support for signalling
	the audit daemon
To: Richard Guy Briggs <rgb@redhat.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Fri, 11 Oct 2019 00:39:35 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]);
	Fri, 11 Oct 2019 00:39:35 +0000 (UTC) for IP:'209.85.208.196'
	DOMAIN:'mail-lj1-f196.google.com'
	HELO:'mail-lj1-f196.google.com' FROM:'paul@paul-moore.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_NONE) 209.85.208.196 mail-lj1-f196.google.com 209.85.208.196
	mail-lj1-f196.google.com <paul@paul-moore.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.43
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: linux-audit@redhat.com
Cc: nhorman@tuxdriver.com, linux-api@vger.kernel.org,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]); Fri, 11 Oct 2019 00:39:43 +0000 (UTC)

On Wed, Sep 18, 2019 at 9:25 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> Add audit container identifier support to the action of signalling the
> audit daemon.
>
> Since this would need to add an element to the audit_sig_info struct,
> a new record type AUDIT_SIGNAL_INFO2 was created with a new
> audit_sig_info2 struct.  Corresponding support is required in the
> userspace code to reflect the new record request and reply type.
> An older userspace won't break since it won't know to request this
> record type.
>
> Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> ---
>  include/linux/audit.h       |  7 +++++++
>  include/uapi/linux/audit.h  |  1 +
>  kernel/audit.c              | 28 ++++++++++++++++++++++++++++
>  kernel/audit.h              |  1 +
>  security/selinux/nlmsgtab.c |  1 +
>  5 files changed, 38 insertions(+)
>
> diff --git a/include/linux/audit.h b/include/linux/audit.h
> index 0c18d8e30620..7b640c4da4ee 100644
> --- a/include/linux/audit.h
> +++ b/include/linux/audit.h
> @@ -23,6 +23,13 @@ struct audit_sig_info {
>         char            ctx[0];
>  };
>
> +struct audit_sig_info2 {
> +       uid_t           uid;
> +       pid_t           pid;
> +       u64             cid;
> +       char            ctx[0];
> +};
> +
>  struct audit_buffer;
>  struct audit_context;
>  struct inode;
> diff --git a/include/uapi/linux/audit.h b/include/uapi/linux/audit.h
> index 4ed080f28b47..693ec6e0288b 100644
> --- a/include/uapi/linux/audit.h
> +++ b/include/uapi/linux/audit.h
> @@ -72,6 +72,7 @@
>  #define AUDIT_SET_FEATURE      1018    /* Turn an audit feature on or off */
>  #define AUDIT_GET_FEATURE      1019    /* Get which features are enabled */
>  #define AUDIT_CONTAINER_OP     1020    /* Define the container id and info */
> +#define AUDIT_SIGNAL_INFO2     1021    /* Get info auditd signal sender */
>
>  #define AUDIT_FIRST_USER_MSG   1100    /* Userspace messages mostly uninteresting to kernel */
>  #define AUDIT_USER_AVC         1107    /* We filter this differently */
> diff --git a/kernel/audit.c b/kernel/audit.c
> index adfb3e6a7f0c..df3db29f5a8a 100644
> --- a/kernel/audit.c
> +++ b/kernel/audit.c
> @@ -125,6 +125,7 @@ struct audit_net {
>  kuid_t         audit_sig_uid = INVALID_UID;
>  pid_t          audit_sig_pid = -1;
>  u32            audit_sig_sid = 0;
> +u64            audit_sig_cid = AUDIT_CID_UNSET;
>
>  /* Records can be lost in several ways:
>     0) [suppressed in audit_alloc]
> @@ -1094,6 +1095,7 @@ static int audit_netlink_ok(struct sk_buff *skb, u16 msg_type)
>         case AUDIT_ADD_RULE:
>         case AUDIT_DEL_RULE:
>         case AUDIT_SIGNAL_INFO:
> +       case AUDIT_SIGNAL_INFO2:
>         case AUDIT_TTY_GET:
>         case AUDIT_TTY_SET:
>         case AUDIT_TRIM:
> @@ -1257,6 +1259,7 @@ static int audit_receive_msg(struct sk_buff *skb, struct nlmsghdr *nlh)
>         struct audit_buffer     *ab;
>         u16                     msg_type = nlh->nlmsg_type;
>         struct audit_sig_info   *sig_data;
> +       struct audit_sig_info2  *sig_data2;
>         char                    *ctx = NULL;
>         u32                     len;
>
> @@ -1516,6 +1519,30 @@ static int audit_receive_msg(struct sk_buff *skb, struct nlmsghdr *nlh)
>                                  sig_data, sizeof(*sig_data) + len);
>                 kfree(sig_data);
>                 break;
> +       case AUDIT_SIGNAL_INFO2:
> +               len = 0;
> +               if (audit_sig_sid) {
> +                       err = security_secid_to_secctx(audit_sig_sid, &ctx, &len);
> +                       if (err)
> +                               return err;
> +               }
> +               sig_data2 = kmalloc(sizeof(*sig_data2) + len, GFP_KERNEL);
> +               if (!sig_data2) {
> +                       if (audit_sig_sid)
> +                               security_release_secctx(ctx, len);
> +                       return -ENOMEM;
> +               }
> +               sig_data2->uid = from_kuid(&init_user_ns, audit_sig_uid);
> +               sig_data2->pid = audit_sig_pid;
> +               if (audit_sig_sid) {
> +                       memcpy(sig_data2->ctx, ctx, len);
> +                       security_release_secctx(ctx, len);
> +               }
> +               sig_data2->cid = audit_sig_cid;
> +               audit_send_reply(skb, seq, AUDIT_SIGNAL_INFO2, 0, 0,
> +                                sig_data2, sizeof(*sig_data2) + len);
> +               kfree(sig_data2);
> +               break;
>         case AUDIT_TTY_GET: {
>                 struct audit_tty_status s;
>                 unsigned int t;
> @@ -2384,6 +2411,7 @@ int audit_signal_info(int sig, struct task_struct *t)
>                 else
>                         audit_sig_uid = uid;
>                 security_task_getsecid(current, &audit_sig_sid);
> +               audit_sig_cid = audit_get_contid(current);
>         }

I've been wondering something as I've been working my way through
these patches and this patch seems like a good spot to discuss this
... Now that we have the concept of an audit container ID "lifetime"
in the kernel, when do we consider the ID gone?  Is it when the last
process in the container exits, or is it when we generate the last
audit record which could possibly contain the audit container ID?
This patch would appear to support the former, but if we wanted the
latter we would need to grab a reference to the audit container ID
struct so it wouldn't "die" on us before we could emit the signal info
record.

--
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
