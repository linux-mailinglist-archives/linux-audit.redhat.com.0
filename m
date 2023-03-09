Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CBB66B17B9
	for <lists+linux-audit@lfdr.de>; Thu,  9 Mar 2023 01:13:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678320825;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=k6hRs4e60HqgxGgNDllRxM0e7rd7BuEr/P4EQ1F/nZM=;
	b=KxOhTI6Hc1qMy5jbjWKO3VE3A/59KGxgcd7gYVxCclGay2r4O7JsI5qam58qPgJrFDeQM4
	1Z6db9XpaCTjyC/v3JQChje4IYJ7S+SBpLEyTRkyr6MoWm/DirYWaD6SB5p/9zOYO43N+t
	7xkzL+yvp/5N7nHDkz6baSXlSjV8xwU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-665-H8nXArzfNYOWUnGD8vYhMg-1; Wed, 08 Mar 2023 19:13:44 -0500
X-MC-Unique: H8nXArzfNYOWUnGD8vYhMg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2B98C3855564;
	Thu,  9 Mar 2023 00:13:42 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3643DC15BA0;
	Thu,  9 Mar 2023 00:13:39 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 9802C1946A51;
	Thu,  9 Mar 2023 00:13:38 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 64CD61946A6E for <linux-audit@listman.corp.redhat.com>;
 Thu,  9 Mar 2023 00:13:24 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 42EA12026D68; Thu,  9 Mar 2023 00:13:24 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3B2D82026D4B
 for <linux-audit@redhat.com>; Thu,  9 Mar 2023 00:13:24 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1C92980D182
 for <linux-audit@redhat.com>; Thu,  9 Mar 2023 00:13:24 +0000 (UTC)
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-166-UTEssUhpNWitfScqvmjEeg-1; Wed,
 08 Mar 2023 19:13:21 -0500
X-MC-Unique: UTEssUhpNWitfScqvmjEeg-1
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 1ECC93F17A
 for <linux-audit@redhat.com>; Thu,  9 Mar 2023 00:04:33 +0000 (UTC)
Received: by mail-pl1-f200.google.com with SMTP id
 c3-20020a170902724300b0019d1ffec36dso130330pll.9
 for <linux-audit@redhat.com>; Wed, 08 Mar 2023 16:04:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678320271;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KmKyg3tRha1AnKqVfY/Q6CLT3J9ubxyKhMoFZHZWdcs=;
 b=jT+GVSJqxLueH0uwGfNvbDCxMcjpoKhL08aiEvSZ7jM1dX9rXb9LE3CcZ75U6ZM4iX
 pZKeBHIa5Psq0ZQ29zrBhHZsh+W2yYNaRAduwSew7+T44PzQEOOVcZnrxcUHXe0Mka5G
 SbPQVbr79GjrqzPLlmVU/EmRYJvz7j1dTiwGl/GFP8YHcINIikyl5plxnKa0DOvG6rZQ
 QL6gaf5/u3afGb/xluZbG2puCHtf/whZPXyhCghU/MnDlXQA+bKAinjGg6/FbUSX9hxv
 bBpUsxgjCCe5X1loctzF3ZVYhsu7qa45NlxgFqRdEFFBA6g4LQCTfAhNV9BHyD+9V4L4
 tfyg==
X-Gm-Message-State: AO0yUKXIHJadvxaIPgLF2hhBYeYHJs0E8ucjwmI275Hqfyht4wii13ez
 ugr3K7EflcOGcByZwrdDnjLufrWMf6uQL1/pslizNBUbWKISohvJTNrZfbivJq8ECQzhaVa1ThJ
 04rFS00MYKzU/BaOFSv32n1u7s4DyUkjmRwgK69yBJOg6c3EVZm5U7Dm8XREW
X-Received: by 2002:a17:903:31cb:b0:196:7c2c:8a02 with SMTP id
 v11-20020a17090331cb00b001967c2c8a02mr7415493ple.0.1678320271458; 
 Wed, 08 Mar 2023 16:04:31 -0800 (PST)
X-Google-Smtp-Source: AK7set+1C3tZvQDSBVgE5V8UnN3ZwzJBM/gQo6gJmLByrS+kQlESlfvOprppNjOjXGneolq+pzZsBn2l3uvVILuXtw4=
X-Received: by 2002:a17:903:31cb:b0:196:7c2c:8a02 with SMTP id
 v11-20020a17090331cb00b001967c2c8a02mr7415480ple.0.1678320270940; Wed, 08 Mar
 2023 16:04:30 -0800 (PST)
MIME-Version: 1.0
From: Bruce Elrick <bruce.elrick@canonical.com>
Date: Wed, 8 Mar 2023 17:04:20 -0700
Message-ID: <CAH6unQK=a54uxPjvdgNrZy57cHwZKw72rJMNeDRxAch8q46dcQ@mail.gmail.com>
Subject: Auditing nftables changes
To: linux-audit@redhat.com
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-BeenThere: linux-audit@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux Audit Discussion <linux-audit.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-audit>,
 <mailto:linux-audit-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-audit/>
List-Post: <mailto:linux-audit@redhat.com>
List-Help: <mailto:linux-audit-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-audit>,
 <mailto:linux-audit-request@redhat.com?subject=subscribe>
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello all,

I'm not sure if this list is appropriate for questions so please let
me know and otherwise ignore if this message is not appropriate.

I'm trying to help someone who is finally migrating from iptables to
nftables on the back-end and needs to therefore migrate their audit
capability.

Currently they have a single simple audit rule to detect when there is
a iptable change from any audit user apart from their service user
using a rule like the accepted answer given in this[0] StackExchange
question, although with added filters on the auid (I have to admit I
don't know the origin of auid=-1 events):

    auditctl -a exit,always -F arch=b64 -F a2=64 -F auid!=-1 -F
auid!=${serviceuser_uid} -S setsockopt -k iptablesChange

They are migrating from Ubuntu bionic to jammy and still using the
iptables front-end but since the back-end changes from default
iptables to default nftables they need to change their audit rules

They did strace testing and noted the syscall changing from

    setsockopt(4, SOL_IP, IPT_SO_SET_REPLACE,
"filter\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"...,
80952) = 0

to

    sendto(3, [{nlmsg_len=20,
nlmsg_type=NFNL_SUBSYS_NFTABLES<<8|NFT_MSG_GETGEN,
nlmsg_flags=NLM_F_REQUEST, nlmsg_seq=0, nlmsg_pid=0},
{nfgen_family=AF_UNSPEC, version=NFNETLINK_V0, res_id=htons(0)}], 20,
0, {sa_family=AF_NETLINK, nl_pid=0, nl_groups=00000000}, 12) = 20

between the two versions.

In my own testing, I decided to approach from the audit tools
perspective so I created a broad rule to capture all system call
related to a test user:

    auditctl -a always,exit -S all -F auid=1001 # 1001 is uid of testuser

Then I tried various operations using my testuser such as
iptables-restore of either a default-accept rule set with no rules or
with one or two simple drop rules. I also tested adding just a single
iptables rule. I then used ausearch to discover what the audit system
captured:

    # ausearch -i -m NETFILTER_CFG
    ...
    ----
    type=PROCTITLE msg=audit(03/07/2023 17:18:55.152:143044) :
proctitle=iptables-restore
    type=SYSCALL msg=audit(03/07/2023 17:18:55.152:143044) :
arch=x86_64 syscall=sendmsg success=yes exit=764 a0=0x3
a1=0x7ffdb0e98db0 a2=0x0 a3=0x7ffdb0e98d9c items=0 ppid=5673 pid=5676
auid=testuser uid=root gid=root euid=root suid=root fsuid=root
egid=root sgid=root fsgid=root tty=pts2 ses=108 comm=iptables-restor
exe=/usr/sbin/xtables-nft-multi subj=unconfined key=(null)
    type=NETFILTER_CFG msg=audit(03/07/2023 17:18:55.152:143044) :
table=filter:30 family=ipv4 entries=12 op=nft_unregister_table
pid=5676 subj=unconfined comm=iptables-restor
    type=NETFILTER_CFG msg=audit(03/07/2023 17:18:55.152:143044) :
table=filter:30 family=ipv4 entries=7 op=nft_register_chain pid=5676
subj=unconfined comm=iptables-restor
    ----
    type=PROCTITLE msg=audit(03/07/2023 17:23:04.390:144459) :
proctitle=sudo /usr/sbin/iptables -A OUTPUT -d 10.100.249.64 -j DROP
    type=SOCKADDR msg=audit(03/07/2023 17:23:04.390:144459) : saddr={
saddr_fam=netlink nlnk-fam=16 nlnk-pid=0 }
    type=SYSCALL msg=audit(03/07/2023 17:23:04.390:144459) :
arch=x86_64 syscall=sendmsg success=yes exit=304 a0=0x3
a1=0x7ffc80659110 a2=0x0 a3=0x7ffc806590fc items=0 ppid=5703 pid=5704
auid=testuser uid=root gid=root euid=root suid=root fsuid=root
egid=root sgid=root fsgid=root tty=pts2 ses=108 comm=iptables
exe=/usr/sbin/xtables-nft-multi subj=unconfined key=(null)
    type=NETFILTER_CFG msg=audit(03/07/2023 17:23:04.390:144459) :
table=filter:31 family=ipv4 entries=1 op=nft_register_rule pid=5704
subj=unconfined comm=iptables

The event sequences seem to make sense with the sockaddr function
selecting the netlink family which agrees with the strace output.

With the change in the back-end to nftables, I can see in either case
that the setsockopt system call with a nice, crisp, single argument
(a2=64/IPT_SO_SET_REPLACE) option with either a sendto or sendmsg
system call but with a pointer to a message structure. I read that
audit rules cannot filter using data inside struct arguments.

My naive interpretation of this is that I'd need to have a rule that
captures all sendmsg syscalls with (auid!=-1 and
auid!=${serviceuser_uid} but I don't know enough about socket syscall
usage to know whether this is too much. I see that write(2) to a
socket is the same as send(2) without the flags so I might assume that
most socket syscalls that are sending data use write(2) and not
send/sendto/sendmsg(2) but I worry this would be too much audit data.

Anyone care to comment or point me in the correct direction?

Cheers...
Bruce

[0] https://unix.stackexchange.com/questions/206891/audit-on-changes-to-the-running-iptables-configuration


--
Bruce Elrick, Ph.D.
Dedicated Support Engineer
Canonical

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

