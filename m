Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 95CE51B0B6B
	for <lists+linux-audit@lfdr.de>; Mon, 20 Apr 2020 14:56:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587387370;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=1tqqTOIW9x3hjPQBQIZ5iMZyx9lF9VgfcCwMHfl/EmI=;
	b=F53cMBbJa6x8gM8tyWXS8OKoEtrBdPDC8U+CSPjYi/N4HRVwaL1kUZtjgI6ixyp8jxlPtZ
	ZZ/XlpSggUVR37XrwiVnJUNy6FJRnFYSrK3ABcwt5EUzA/tWbfqkqE3Qq1VPxnU0sUO//6
	fVQ0VhibceWo/1DpukxoXwLVah2INa0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-315-J20XS9obNNG3vdTbIxZQvA-1; Mon, 20 Apr 2020 08:56:06 -0400
X-MC-Unique: J20XS9obNNG3vdTbIxZQvA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C0B568024D2;
	Mon, 20 Apr 2020 12:56:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 552525DA88;
	Mon, 20 Apr 2020 12:55:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1AF4393909;
	Mon, 20 Apr 2020 12:55:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03K7saUV030552 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 20 Apr 2020 03:54:36 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 73A8310E60DF; Mon, 20 Apr 2020 07:54:36 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6F75510E60D8
	for <linux-audit@redhat.com>; Mon, 20 Apr 2020 07:54:32 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 433428007D2
	for <linux-audit@redhat.com>; Mon, 20 Apr 2020 07:54:32 +0000 (UTC)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com
	[209.85.167.172]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-484-_lH_zVxYOeaIDM4S1X4F6A-1; Mon, 20 Apr 2020 03:54:29 -0400
X-MC-Unique: _lH_zVxYOeaIDM4S1X4F6A-1
Received: by mail-oi1-f172.google.com with SMTP id q204so7958709oia.13;
	Mon, 20 Apr 2020 00:54:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
	bh=hBRewfZLEdEXgdMMzcF6oxV7PyUHFI8JhbV7+xop+mA=;
	b=LFJ8CoOZCrJifz+5OFsecmsQsLShw1KIOq6JJvzZPHp7xGmi47w9NveczqZs374WE6
	BAAr9hpJKHpmua0d786AxTHzFV8cn7kXRfhfKMjvT9WKWNrabAVp7+2ZCaGR08Qm2lnT
	MnxwLet2mCo3kL5G66/uyGbw0kCbubu4eDvP+s48+8zO/tF1yKb9+RxJ+Dnv7/QM9G+b
	GyF2LgKLn+kxCFIj1caSakpLOI6IjxV3xCFX/BgklA/6eyKzaxTKGQ1gbkTy3HKOJGGp
	1Kat5JzbxnOQU0TUdZ3Ra9lPGroaa6oJ1DHiDkCftiNxAW9ydbz1FHDjejC0P3yiEzBR
	5eJQ==
X-Gm-Message-State: AGi0PuZkjWKSA6pqB58i3aPU5oSQPyEQNTnNlABYDz4EJAgRs1K6bPrz
	vJ5c8LCarAKr/sTRXTOWcP4vgUMhc+QVbd3amv7ogv1Foaw=
X-Google-Smtp-Source: APiQypLDcaAV1B3O5w4PYqTSJDYU0Em5y1zib8IJ2f7mYGWXM7nSZXZ4pxHad+HhCYkuwICEQZTMqvz0YTFXYXyXuhc=
X-Received: by 2002:a05:6808:6d8:: with SMTP id
	m24mr10090307oih.137.1587369268536; 
	Mon, 20 Apr 2020 00:54:28 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?B?5Lq/5LiA?= <teroincn@gmail.com>
Date: Mon, 20 Apr 2020 15:54:16 +0800
Message-ID: <CANTwqXCxk0_U2heNR0ua3Pb-ic=vsJj0Jot9z=3WhTMwfRKSag@mail.gmail.com>
Subject: kernel: audit.c: is it a memleak of net in function audit_send_reply
To: paul@paul-moore.com, eparis@redhat.com
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03K7saUV030552
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Mon, 20 Apr 2020 08:55:30 -0400
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
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi, all:

when reviewing code in function audit_send_reply, I notice that if
kthread_run return failure, the net reference would not be released
because reply has been kfree directly.

static void audit_send_reply(struct sk_buff *request_skb, int seq, int
type, int done,
     int multi, const void *payload, int size)
{
    struct net *net = sock_net(NETLINK_CB(request_skb).sk);
    struct sk_buff *skb;
    struct task_struct *tsk;
    struct audit_reply *reply = kmalloc(sizeof(struct audit_reply),
                                                           GFP_KERNEL);

    if (!reply)
        return;

    skb = audit_make_reply(seq, type, done, multi, payload, size);
    if (!skb)
        goto out;

    reply->net = get_net(net);     // hold a reference of net here
    reply->portid = NETLINK_CB(request_skb).portid;
    reply->skb = skb;

    tsk = kthread_run(audit_send_reply_thread, reply, "audit_send_reply");
    if (!IS_ERR(tsk))
        return;
    kfree_skb(skb);

    out:
        kfree(reply);      // kfree reply without release the net reference.
}


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

