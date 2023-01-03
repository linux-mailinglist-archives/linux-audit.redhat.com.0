Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA1765D503
	for <lists+linux-audit@lfdr.de>; Wed,  4 Jan 2023 15:07:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1672841256;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=HnqvU7+uzJaZkngKGkJyY5Dl3BCY1boSbGLqeDV5kIQ=;
	b=NFz9uq0NMy4N6OodhHvASQN38JtAclVHK34RqsY4Pd6kSOayGVtqIAkZ8gveOYT6C8FdjE
	1zE9C3O6/3TqUBR5jhM4Ye0/7eGPWztiNW65rWwAKrLgVmpkFyhqQNvla+f76CRRTdp5aT
	hWuPl2cm8sjKW6uykPSskjfZV7EJCrU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-185-0zpg9lQIOImIp79Xy0SKvQ-1; Wed, 04 Jan 2023 09:07:32 -0500
X-MC-Unique: 0zpg9lQIOImIp79Xy0SKvQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9A6381C087A6;
	Wed,  4 Jan 2023 14:07:29 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3FF692166B30;
	Wed,  4 Jan 2023 14:07:23 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id DAC4A1947044;
	Wed,  4 Jan 2023 14:07:20 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 3389A1946587 for <linux-audit@listman.corp.redhat.com>;
 Tue,  3 Jan 2023 18:12:24 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D4B3A2026D68; Tue,  3 Jan 2023 18:12:23 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CA0BF2026D4B
 for <linux-audit@redhat.com>; Tue,  3 Jan 2023 18:12:23 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 99ED21C00403
 for <linux-audit@redhat.com>; Tue,  3 Jan 2023 18:12:23 +0000 (UTC)
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com
 [209.85.166.180]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-314-4qfncZCpMlOltiqaQ93_qg-1; Tue, 03 Jan 2023 13:12:21 -0500
X-MC-Unique: 4qfncZCpMlOltiqaQ93_qg-1
Received: by mail-il1-f180.google.com with SMTP id c20so14584649ilj.10
 for <linux-audit@redhat.com>; Tue, 03 Jan 2023 10:12:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:message-id:thread-topic:subject
 :from:date:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GO1V8/zoXG2+E8MXdFkLhzLUXI8HS7nbu4QDqEVUVk4=;
 b=q30+4GxeTh9k82ru7Tl+JIa+xbMIV24b5lj88M9kPzxAMYHWa9Tk1jcmgGxPRTlB/Z
 6FQ8pn5yTRsstkx15bMeN7WArM0Zq7B5Iw8F3XXJNy0BO+PYEgNtqxBHZa7wU4S4XhX5
 znKmrHY/SUdfvJc9Zgkn07SQPOpZC+0jEWGRyLuFlWkmPttZrORO8ZllScXRlk3UWkQu
 7V/iCo/9QE1dgOCr3RslX/jNwYK1qnG2bpJE8En22MkT+JjBCtJfHTfQ38AZNX8MCr7E
 FaOdTdmtN3VScCEXg38+PDkr1RGNvuRL60lLnfbVJlhiu9qlWIl+PApVKPIXdphuILAY
 yZ4g==
X-Gm-Message-State: AFqh2koaNsdAFlYBQ4Of+7ubXQXU6OBoskqxMp5QnpwURAmJzPGGbst3
 PZLOQQEzay3rI4oBKN+Rjwg=
X-Google-Smtp-Source: AMrXdXvUm2cSG+kPR9yrrKK6gjSK0HSMnrOLkqLv7IK3+RP1vLpbnotnv+h+PDDJPmTvSJJxlfaBCA==
X-Received: by 2002:a05:6e02:78f:b0:300:5860:f07e with SMTP id
 q15-20020a056e02078f00b003005860f07emr29416356ils.31.1672769540101; 
 Tue, 03 Jan 2023 10:12:20 -0800 (PST)
Received: from LAPTOP-4OFSRCBD ([2601:281:c502:6e30:314c:dc76:6124:6f0e])
 by smtp.gmail.com with ESMTPSA id
 k12-20020a92c24c000000b0030c0dce44b1sm6553653ilo.15.2023.01.03.10.12.19
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 03 Jan 2023 10:12:19 -0800 (PST)
MIME-Version: 1.0
Date: Tue, 3 Jan 2023 11:12:18 -0700
From: Bryce <oliverwearzprada@gmail.com>
Subject: Re: [PATCH v2] bpf: restore the ebpf program ID for
 BPF_AUDIT_UNLOAD and PERF_BPF_EVENT_PROG_UNLOAD
Thread-Topic: Re: [PATCH v2] bpf: restore the ebpf program ID for
 BPF_AUDIT_UNLOAD and PERF_BPF_EVENT_PROG_UNLOAD
Message-ID: <294DC0E6-5B0C-4ED5-B22C-C6E4A86B0A43@hxcore.ol>
To: "paul@paul-moore.com" <paul@paul-moore.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Mimecast-Bulk-Signature: yes
X-Mimecast-Spam-Signature: bulk
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mailman-Approved-At: Wed, 04 Jan 2023 14:07:19 +0000
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
Cc: "bpf@vger.kernel.org" <bpf@vger.kernel.org>,
 "linux-audit@redhat.com" <linux-audit@redhat.com>,
 "burn.alting@iinet.net.au" <burn.alting@iinet.net.au>,
 "ast@kernel.org" <ast@kernel.org>, "sdf@google.com" <sdf@google.com>
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 1
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="===============7445430453268346090=="

--===============7445430453268346090==
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset="utf-8"

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40"><head><meta ht=
tp-equiv=3DContent-Type content=3D"text/html; charset=3Dutf-8"><meta name=
=3DGenerator content=3D"Microsoft Word 15 (filtered medium)"><style><!--
/* Font Definitions */
@font-face
=09{font-family:"Cambria Math";
=09panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
=09{font-family:Calibri;
=09panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
=09{font-family:"Microsoft Yi Baiti";
=09panose-1:3 0 5 0 0 0 0 0 0 0;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
=09{margin:0cm;
=09font-size:11.0pt;
=09font-family:"Calibri",sans-serif;}
pre
=09{mso-style-priority:99;
=09mso-style-link:"HTML Preformatted Char";
=09margin:0cm;
=09margin-bottom:.0001pt;
=09font-size:10.0pt;
=09font-family:"Courier New";}
span.HTMLPreformattedChar
=09{mso-style-name:"HTML Preformatted Char";
=09mso-style-priority:99;
=09mso-style-link:"HTML Preformatted";
=09font-family:"Courier New";}
.MsoChpDefault
=09{mso-style-type:export-only;}
@page WordSection1
=09{size:612.0pt 792.0pt;
=09margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
=09{page:WordSection1;}
--></style></head><body lang=3DEN-TT link=3Dblue vlink=3D"#954F72" style=3D=
'word-wrap:break-word'><div class=3DWordSection1><div><pre><strong><span st=
yle=3D'font-family:"Courier New";background:yellow;mso-highlight:yellow'>Wh=
en changing the ebpf program put() routines to support being called<o:p></o=
:p></span></strong></pre><pre><strong><span style=3D'font-family:"Courier N=
ew";background:yellow;mso-highlight:yellow'>from within IRQ context the pro=
gram ID was reset to zero prior to<o:p></o:p></span></strong></pre><pre><st=
rong><span style=3D'font-family:"Courier New";background:yellow;mso-highlig=
ht:yellow'>calling the perf event and audit UNLOAD record generators, which=
<o:p></o:p></span></strong></pre><pre><strong><span style=3D'font-family:"C=
ourier New";background:yellow;mso-highlight:yellow'>resulted in problems as=
 the ebpf program ID was bogus (always zero).<o:p></o:p></span></strong></p=
re><pre><strong><span style=3D'font-family:"Courier New";background:yellow;=
mso-highlight:yellow'>This patch resolves this by adding a new flag, bpf_pr=
og::valid_id, to<o:p></o:p></span></strong></pre><pre><strong><span style=
=3D'font-family:"Courier New";background:yellow;mso-highlight:yellow'>indic=
ate when the bpf_prog_aux ID field is valid; it is set to true/1<o:p></o:p>=
</span></strong></pre><pre><strong><span style=3D'font-family:"Courier New"=
;background:yellow;mso-highlight:yellow'>in bpf_prog_alloc_id() and set to =
false/0 in bpf_prog_free_id().=C2=A0 In<o:p></o:p></span></strong></pre><pr=
e><strong><span style=3D'font-family:"Courier New";background:yellow;mso-hi=
ghlight:yellow'>order to help ensure that access to the bpf_prog_aux ID fie=
ld takes<o:p></o:p></span></strong></pre><pre><strong><span style=3D'font-f=
amily:"Courier New";background:yellow;mso-highlight:yellow'>into account th=
e new valid_id flag, the bpf_prog_aux ID field is<o:p></o:p></span></strong=
></pre><pre><strong><span style=3D'font-family:"Courier New";background:yel=
low;mso-highlight:yellow'>renamed to bpf_prog_aux::__id and a getter functi=
on,<o:p></o:p></span></strong></pre><pre><strong><span style=3D'font-family=
:"Courier New";background:yellow;mso-highlight:yellow'>bpf_prog_get_id(), w=
as created and all users of bpf_prog_aux::id were<o:p></o:p></span></strong=
></pre><pre><strong><span style=3D'font-family:"Courier New";background:yel=
low;mso-highlight:yellow'>converted to the new caller.=C2=A0 Exceptions to =
this include some of the<o:p></o:p></span></strong></pre><pre><strong><span=
 style=3D'font-family:"Courier New";background:yellow;mso-highlight:yellow'=
>internal ebpf functions and the xdp trace points, although the latter<o:p>=
</o:p></span></strong></pre><pre><strong><span style=3D'font-family:"Courie=
r New";background:yellow;mso-highlight:yellow'>still take into account the =
valid_id flag.<o:p></o:p></span></strong></pre><pre><strong><span style=3D'=
font-family:"Courier New";background:yellow;mso-highlight:yellow'><o:p>&nbs=
p;</o:p></span></strong></pre><pre><strong><span style=3D'font-family:"Cour=
ier New";background:yellow;mso-highlight:yellow'>I also modified the bpf_au=
dit_prog() logic used to associate the<o:p></o:p></span></strong></pre><pre=
><strong><span style=3D'font-family:"Courier New";background:yellow;mso-hig=
hlight:yellow'>AUDIT_BPF record with other associated records, e.g. @ctx !=
=3D NULL.<o:p></o:p></span></strong></pre><pre><strong><span style=3D'font-=
family:"Courier New";background:yellow;mso-highlight:yellow'>Instead of key=
ing off the operation, it now keys off the execution<o:p></o:p></span></str=
ong></pre><pre><strong><span style=3D'font-family:"Courier New";background:=
yellow;mso-highlight:yellow'>context, e.g. '!in_irg &amp;&amp; !irqs_disabl=
ed()', which is much more<o:p></o:p></span></strong></pre><pre><strong><spa=
n style=3D'font-family:"Courier New";background:yellow;mso-highlight:yellow=
'>appropriate and should help better connect the UNLOAD operations with<o:p=
></o:p></span></strong></pre><pre><strong><span style=3D'font-family:"Couri=
er New";background:yellow;mso-highlight:yellow'>the associated audit state =
(other audit records).<o:p></o:p></span></strong></pre><pre><strong><span s=
tyle=3D'font-family:"Courier New";background:yellow;mso-highlight:yellow'><=
o:p>&nbsp;</o:p></span></strong></pre><pre><strong><span style=3D'font-fami=
ly:"Courier New";background:yellow;mso-highlight:yellow'>Fixes: d809e134be7=
a (&quot;bpf: Prepare bpf_prog_put() to be called from irq context.&quot;)<=
o:p></o:p></span></strong></pre><pre><strong><span style=3D'font-family:"Co=
urier New";background:yellow;mso-highlight:yellow'>Reported-by: Burn Alting=
 &lt;burn.alting@iinet.net.au&gt;<o:p></o:p></span></strong></pre><pre><str=
ong><span style=3D'font-family:"Courier New";background:yellow;mso-highligh=
t:yellow'>Reported-by: Jiri Olsa &lt;olsajiri@gmail.com&gt;<o:p></o:p></spa=
n></strong></pre><pre><strong><span style=3D'font-family:"Courier New";back=
ground:yellow;mso-highlight:yellow'>Signed-off-by: Paul Moore &lt;paul@paul=
-moore.com&gt;<o:p></o:p></span></strong></pre><pre><strong><span style=3D'=
font-family:"Courier New";background:yellow;mso-highlight:yellow'><o:p>&nbs=
p;</o:p></span></strong></pre><pre><strong><span style=3D'font-family:"Cour=
ier New";background:yellow;mso-highlight:yellow'>--<o:p></o:p></span></stro=
ng></pre><pre><strong><span style=3D'font-family:"Courier New";background:y=
ellow;mso-highlight:yellow'>* v2<o:p></o:p></span></strong></pre><pre><stro=
ng><span style=3D'font-family:"Courier New";background:yellow;mso-highlight=
:yellow'>=C2=A0 - change subj<o:p></o:p></span></strong></pre><pre><strong>=
<span style=3D'font-family:"Courier New";background:yellow;mso-highlight:ye=
llow'>=C2=A0 - add mention of the perf regression<o:p></o:p></span></strong=
></pre><pre><strong><span style=3D'font-family:"Courier New";background:yel=
low;mso-highlight:yellow'>=C2=A0 - drop the dedicated program audit ID<o:p>=
</o:p></span></strong></pre><pre><strong><span style=3D'font-family:"Courie=
r New";background:yellow;mso-highlight:yellow'>=C2=A0 - add the bpf_prog::v=
alid_id flag, bpf_prog_get_id() getter<o:p></o:p></span></strong></pre><pre=
><strong><span style=3D'font-family:"Courier New";background:yellow;mso-hig=
hlight:yellow'>=C2=A0 - convert prog ID users to new ID getter<o:p></o:p></=
span></strong></pre><pre><strong><span style=3D'font-family:"Courier New";b=
ackground:yellow;mso-highlight:yellow'>* v1<o:p></o:p></span></strong></pre=
><pre><strong><span style=3D'font-family:"Courier New";background:yellow;ms=
o-highlight:yellow'>=C2=A0 - subj was: &quot;bpf: restore the ebpf audit UN=
LOAD id field&quot;<o:p></o:p></span></strong></pre><pre><strong><span styl=
e=3D'font-family:"Courier New";background:yellow;mso-highlight:yellow'>=C2=
=A0 - initial draft<o:p></o:p></span></strong></pre><pre><strong><span styl=
e=3D'font-family:"Courier New";background:yellow;mso-highlight:yellow'>---<=
o:p></o:p></span></strong></pre><pre><strong><span style=3D'font-family:"Co=
urier New";background:yellow;mso-highlight:yellow'> drivers/net/netdevsim/b=
pf.c=C2=A0 |=C2=A0 6 ++++--<o:p></o:p></span></strong></pre><pre><strong><s=
pan style=3D'font-family:"Courier New";background:yellow;mso-highlight:yell=
ow'> include/linux/bpf.h=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0| 11 +++++++++--<o:p></o:p></span></strong></pre><pre><strong><span s=
tyle=3D'font-family:"Courier New";background:yellow;mso-highlight:yellow'> =
include/linux/bpf_verifier.h |=C2=A0 2 +-<o:p></o:p></span></strong></pre><=
pre><strong><span style=3D'font-family:"Courier New";background:yellow;mso-=
highlight:yellow'> include/trace/events/xdp.h=C2=A0=C2=A0 |=C2=A0 4 ++--<o:=
p></o:p></span></strong></pre><pre><strong><span style=3D'font-family:"Cour=
ier New";background:yellow;mso-highlight:yellow'> kernel/bpf/arraymap.c=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-<o:p></o:p></span></str=
ong></pre><pre><strong><span style=3D'font-family:"Courier New";background:=
yellow;mso-highlight:yellow'> kernel/bpf/bpf_struct_ops.c=C2=A0 |=C2=A0 2 +=
-<o:p></o:p></span></strong></pre><pre><strong><span style=3D'font-family:"=
Courier New";background:yellow;mso-highlight:yellow'> kernel/bpf/cgroup.c=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-<o:p></o=
:p></span></strong></pre><pre><strong><span style=3D'font-family:"Courier N=
ew";background:yellow;mso-highlight:yellow'> kernel/bpf/core.c=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-<o:p></o=
:p></span></strong></pre><pre><strong><span style=3D'font-family:"Courier N=
ew";background:yellow;mso-highlight:yellow'> kernel/bpf/cpumap.c=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-<o:p></o:p></span=
></strong></pre><pre><strong><span style=3D'font-family:"Courier New";backg=
round:yellow;mso-highlight:yellow'> kernel/bpf/devmap.c=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-<o:p></o:p></span></strong=
></pre><pre><strong><span style=3D'font-family:"Courier New";background:yel=
low;mso-highlight:yellow'> kernel/bpf/syscall.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 27 +++++++++++++++------------<o:p></o:p></span></s=
trong></pre><pre><strong><span style=3D'font-family:"Courier New";backgroun=
d:yellow;mso-highlight:yellow'> kernel/events/core.c=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 6 +++++-<o:p></o:p></span></strong></pr=
e><pre><strong><span style=3D'font-family:"Courier New";background:yellow;m=
so-highlight:yellow'> kernel/trace/bpf_trace.c=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0 2 +-<o:p></o:p></span></strong></pre><pre><strong><span style=3D'font-f=
amily:"Courier New";background:yellow;mso-highlight:yellow'> net/core/dev.c=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 2 +-<o:p></o:p></span></strong></pre><pre><strong><span s=
tyle=3D'font-family:"Courier New";background:yellow;mso-highlight:yellow'> =
net/core/filter.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 3 ++-<o:p></o:p></span></strong></pre><pre><strong><span =
style=3D'font-family:"Courier New";background:yellow;mso-highlight:yellow'>=
 net/core/rtnetlink.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0 2 +-<o:p></o:p></span></strong></pre><pre><strong><span style=3D'font-f=
amily:"Courier New";background:yellow;mso-highlight:yellow'> net/core/sock_=
map.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-<o:=
p></o:p></span></strong></pre><pre><strong><span style=3D'font-family:"Cour=
ier New";background:yellow;mso-highlight:yellow'> net/ipv6/seg6_local.c=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 3 ++-<o:p></o:p></span></st=
rong></pre><pre><strong><span style=3D'font-family:"Courier New";background=
:yellow;mso-highlight:yellow'> net/sched/act_bpf.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-<o:p></o:p></span></strong></pre=
><pre><strong><span style=3D'font-family:"Courier New";background:yellow;ms=
o-highlight:yellow'> net/sched/cls_bpf.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-<o:p></o:p></span></strong></pre><pre><st=
rong><span style=3D'font-family:"Courier New";background:yellow;mso-highlig=
ht:yellow'> 20 files changed, 52 insertions(+), 34 deletions(-)<o:p></o:p><=
/span></strong></pre><pre><strong><span style=3D'font-family:"Courier New";=
background:yellow;mso-highlight:yellow'><o:p>&nbsp;</o:p></span></strong></=
pre><pre><strong><span style=3D'font-family:"Courier New";background:yellow=
;mso-highlight:yellow'>diff --git a/drivers/net/netdevsim/bpf.c b/drivers/n=
et/netdevsim/bpf.c<o:p></o:p></span></strong></pre><pre><strong><span style=
=3D'font-family:"Courier New";background:yellow;mso-highlight:yellow'>index=
 50854265864d..2795f03f5f34 100644<o:p></o:p></span></strong></pre><pre><st=
rong><span style=3D'font-family:"Courier New";background:yellow;mso-highlig=
ht:yellow'>--- a/drivers/net/netdevsim/bpf.c<o:p></o:p></span></strong></pr=
e><pre><strong><span style=3D'font-family:"Courier New";background:yellow;m=
so-highlight:yellow'>+++ b/drivers/net/netdevsim/bpf.c<o:p></o:p></span></s=
trong></pre><pre><strong><span style=3D'font-family:"Courier New";backgroun=
d:yellow;mso-highlight:yellow'>@@ -109,7 +109,7 @@ nsim_bpf_offload(struct =
netdevsim *ns, struct bpf_prog *prog, bool oldprog)<o:p></o:p></span></stro=
ng></pre><pre><strong><span style=3D'font-family:"Courier New";background:y=
ellow;mso-highlight:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0&quot;bad offload state, expected offload %sto be acti=
ve&quot;,<o:p></o:p></span></strong></pre><pre><strong><span style=3D'font-=
family:"Courier New";background:yellow;mso-highlight:yellow'> =C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0oldprog ? &quot;&quo=
t; : &quot;not &quot;);<o:p></o:p></span></strong></pre><pre><strong><span =
style=3D'font-family:"Courier New";background:yellow;mso-highlight:yellow'>=
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ns-&gt;bpf_offloaded =3D prog;<o:p></=
o:p></span></strong></pre><pre><strong><span style=3D'font-family:"Courier =
New";background:yellow;mso-highlight:yellow'>-=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 ns-&gt;bpf_offloaded_id =3D prog ? prog-&gt;aux-&gt;id : 0;<o:p><=
/o:p></span></strong></pre><pre><strong><span style=3D'font-family:"Courier=
 New";background:yellow;mso-highlight:yellow'>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 ns-&gt;bpf_offloaded_id =3D prog ? bpf_prog_get_id(prog) : 0;<o:p=
></o:p></span></strong></pre><pre><strong><span style=3D'font-family:"Couri=
er New";background:yellow;mso-highlight:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 nsim_prog_set_loaded(prog, true);<o:p></o:p></span></strong></=
pre><pre><strong><span style=3D'font-family:"Courier New";background:yellow=
;mso-highlight:yellow'> <o:p></o:p></span></strong></pre><pre><strong><span=
 style=3D'font-family:"Courier New";background:yellow;mso-highlight:yellow'=
>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;<o:p></o:p></span></st=
rong></pre><pre><strong><span style=3D'font-family:"Courier New";background=
:yellow;mso-highlight:yellow'>@@ -221,6 +221,7 @@ static int nsim_bpf_creat=
e_prog(struct nsim_dev *nsim_dev,<o:p></o:p></span></strong></pre><pre><str=
ong><span style=3D'font-family:"Courier New";background:yellow;mso-highligh=
t:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct nsim_bpf_bound_prog =
*state;<o:p></o:p></span></strong></pre><pre><strong><span style=3D'font-fa=
mily:"Courier New";background:yellow;mso-highlight:yellow'> =C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 char name[16];<o:p></o:p></span></strong></pre><pre><=
strong><span style=3D'font-family:"Courier New";background:yellow;mso-highl=
ight:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int ret;<o:p></o:p></spa=
n></strong></pre><pre><strong><span style=3D'font-family:"Courier New";back=
ground:yellow;mso-highlight:yellow'>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u=
32 id;<o:p></o:p></span></strong></pre><pre><strong><span style=3D'font-fam=
ily:"Courier New";background:yellow;mso-highlight:yellow'> <o:p></o:p></spa=
n></strong></pre><pre><strong><span style=3D'font-family:"Courier New";back=
ground:yellow;mso-highlight:yellow'>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 state =3D kzalloc(sizeof(*state), GFP_KERNEL);<o:p></o:p></span></stron=
g></pre><pre><strong><span style=3D'font-family:"Courier New";background:ye=
llow;mso-highlight:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!state=
)<o:p></o:p></span></strong></pre><pre><strong><span style=3D'font-family:"=
Courier New";background:yellow;mso-highlight:yellow'>@@ -239,7 +240,8 @@ st=
atic int nsim_bpf_create_prog(struct nsim_dev *nsim_dev,<o:p></o:p></span><=
/strong></pre><pre><strong><span style=3D'font-family:"Courier New";backgro=
und:yellow;mso-highlight:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;<o:p></o:p></span></stro=
ng></pre><pre><strong><span style=3D'font-family:"Courier New";background:y=
ellow;mso-highlight:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }<o:p></o=
:p></span></strong></pre><pre><strong><span style=3D'font-family:"Courier N=
ew";background:yellow;mso-highlight:yellow'> <o:p></o:p></span></strong></p=
re><pre><strong><span style=3D'font-family:"Courier New";background:yellow;=
mso-highlight:yellow'>-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 debugfs_create_=
u32(&quot;id&quot;, 0400, state-&gt;ddir, &amp;prog-&gt;aux-&gt;id);<o:p></=
o:p></span></strong></pre><pre><strong><span style=3D'font-family:"Courier =
New";background:yellow;mso-highlight:yellow'>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 id =3D bpf_prog_get_id(prog);<o:p></o:p></span></strong></pre><pr=
e><strong><span style=3D'font-family:"Courier New";background:yellow;mso-hi=
ghlight:yellow'>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 debugfs_create_u32(&q=
uot;id&quot;, 0400, state-&gt;ddir, &amp;id);<o:p></o:p></span></strong></p=
re><pre><strong><span style=3D'font-family:"Courier New";background:yellow;=
mso-highlight:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 debugfs_create_=
file(&quot;state&quot;, 0400, state-&gt;ddir,<o:p></o:p></span></strong></p=
re><pre><strong><span style=3D'font-family:"Courier New";background:yellow;=
mso-highlight:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 =C2=A0=C2=A0=C2=A0=C2=A0&amp;state-&gt;state, &amp;nsim_bpf_string_fops);<=
o:p></o:p></span></strong></pre><pre><strong><span style=3D'font-family:"Co=
urier New";background:yellow;mso-highlight:yellow'> =C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 debugfs_create_bool(&quot;loaded&quot;, 0400, state-&gt;ddi=
r, &amp;state-&gt;is_loaded);<o:p></o:p></span></strong></pre><pre><strong>=
<span style=3D'font-family:"Courier New";background:yellow;mso-highlight:ye=
llow'>diff --git a/include/linux/bpf.h b/include/linux/bpf.h<o:p></o:p></sp=
an></strong></pre><pre><strong><span style=3D'font-family:"Courier New";bac=
kground:yellow;mso-highlight:yellow'>index 9e7d46d16032..18e965bd7db9 10064=
4<o:p></o:p></span></strong></pre><pre><strong><span style=3D'font-family:"=
Courier New";background:yellow;mso-highlight:yellow'>--- a/include/linux/bp=
f.h<o:p></o:p></span></strong></pre><pre><strong><span style=3D'font-family=
:"Courier New";background:yellow;mso-highlight:yellow'>+++ b/include/linux/=
bpf.h<o:p></o:p></span></strong></pre><pre><strong><span style=3D'font-fami=
ly:"Courier New";background:yellow;mso-highlight:yellow'>@@ -1102,7 +1102,7=
 @@ struct bpf_prog_aux {<o:p></o:p></span></strong></pre><pre><strong><spa=
n style=3D'font-family:"Courier New";background:yellow;mso-highlight:yellow=
'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u32 max_pkt_offset;<o:p></o:p></spa=
n></strong></pre><pre><strong><span style=3D'font-family:"Courier New";back=
ground:yellow;mso-highlight:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u=
32 max_tp_access;<o:p></o:p></span></strong></pre><pre><strong><span style=
=3D'font-family:"Courier New";background:yellow;mso-highlight:yellow'> =C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u32 stack_depth;<o:p></o:p></span></stron=
g></pre><pre><strong><span style=3D'font-family:"Courier New";background:ye=
llow;mso-highlight:yellow'>-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u32 id;<o:=
p></o:p></span></strong></pre><pre><strong><span style=3D'font-family:"Cour=
ier New";background:yellow;mso-highlight:yellow'>+=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 u32 __id; /* access via bpf_prog_get_id() to check bpf_prog::v=
alid_id */<o:p></o:p></span></strong></pre><pre><strong><span style=3D'font=
-family:"Courier New";background:yellow;mso-highlight:yellow'> =C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 u32 func_cnt; /* used by non-func prog as the numb=
er of func progs */<o:p></o:p></span></strong></pre><pre><strong><span styl=
e=3D'font-family:"Courier New";background:yellow;mso-highlight:yellow'> =C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u32 func_idx; /* 0 for non-func prog, the=
 index in func array for func prog */<o:p></o:p></span></strong></pre><pre>=
<strong><span style=3D'font-family:"Courier New";background:yellow;mso-high=
light:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u32 attach_btf_id; /* i=
n-kernel BTF type id to attach to */<o:p></o:p></span></strong></pre><pre><=
strong><span style=3D'font-family:"Courier New";background:yellow;mso-highl=
ight:yellow'>@@ -1197,7 +1197,8 @@ struct bpf_prog {<o:p></o:p></span></str=
ong></pre><pre><strong><span style=3D'font-family:"Courier New";background:=
yellow;mso-highlight:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enforce_expected_att=
ach_type:1, /* Enforce expected_attach_type checking at attach time */<o:p>=
</o:p></span></strong></pre><pre><strong><span style=3D'font-family:"Courie=
r New";background:yellow;mso-highlight:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ca=
ll_get_stack:1, /* Do we call bpf_get_stack() or bpf_get_stackid() */<o:p><=
/o:p></span></strong></pre><pre><strong><span style=3D'font-family:"Courier=
 New";background:yellow;mso-highlight:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ca=
ll_get_func_ip:1, /* Do we call get_func_ip() */<o:p></o:p></span></strong>=
</pre><pre><strong><span style=3D'font-family:"Courier New";background:yell=
ow;mso-highlight:yellow'>-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tstamp_type_access:1; /=
* Accessed __sk_buff-&gt;tstamp_type */<o:p></o:p></span></strong></pre><pr=
e><strong><span style=3D'font-family:"Courier New";background:yellow;mso-hi=
ghlight:yellow'>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tstamp_type_access:1, /* Accesse=
d __sk_buff-&gt;tstamp_type */<o:p></o:p></span></strong></pre><pre><strong=
><span style=3D'font-family:"Courier New";background:yellow;mso-highlight:y=
ellow'>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 valid_id:1; /* Is bpf_prog::aux::__id val=
id? */<o:p></o:p></span></strong></pre><pre><strong><span style=3D'font-fam=
ily:"Courier New";background:yellow;mso-highlight:yellow'> =C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 enum bpf_prog_type=C2=A0=C2=A0=C2=A0=C2=A0 type;=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Type of BPF program =
*/<o:p></o:p></span></strong></pre><pre><strong><span style=3D'font-family:=
"Courier New";background:yellow;mso-highlight:yellow'> =C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 enum bpf_attach_type=C2=A0=C2=A0 expected_attach_type; /=
* For some prog types */<o:p></o:p></span></strong></pre><pre><strong><span=
 style=3D'font-family:"Courier New";background:yellow;mso-highlight:yellow'=
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u32=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 len;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* =
Number of filter blocks */<o:p></o:p></span></strong></pre><pre><strong><sp=
an style=3D'font-family:"Courier New";background:yellow;mso-highlight:yello=
w'>@@ -1688,6 +1689,12 @@ void bpf_prog_inc(struct bpf_prog *prog);<o:p></o=
:p></span></strong></pre><pre><strong><span style=3D'font-family:"Courier N=
ew";background:yellow;mso-highlight:yellow'> struct bpf_prog * __must_check=
 bpf_prog_inc_not_zero(struct bpf_prog *prog);<o:p></o:p></span></strong></=
pre><pre><strong><span style=3D'font-family:"Courier New";background:yellow=
;mso-highlight:yellow'> void bpf_prog_put(struct bpf_prog *prog);<o:p></o:p=
></span></strong></pre><pre><strong><span style=3D'font-family:"Courier New=
";background:yellow;mso-highlight:yellow'> <o:p></o:p></span></strong></pre=
><pre><strong><span style=3D'font-family:"Courier New";background:yellow;ms=
o-highlight:yellow'>+static inline u32 bpf_prog_get_id(const struct bpf_pro=
g *prog)<o:p></o:p></span></strong></pre><pre><strong><span style=3D'font-f=
amily:"Courier New";background:yellow;mso-highlight:yellow'>+{<o:p></o:p></=
span></strong></pre><pre><strong><span style=3D'font-family:"Courier New";b=
ackground:yellow;mso-highlight:yellow'>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 if (WARN(!prog-&gt;valid_id, &quot;Attempting to use an invalid eBPF pr=
ogram&quot;))<o:p></o:p></span></strong></pre><pre><strong><span style=3D'f=
ont-family:"Courier New";background:yellow;mso-highlight:yellow'>+=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 retur=
n 0;<o:p></o:p></span></strong></pre><pre><strong><span style=3D'font-famil=
y:"Courier New";background:yellow;mso-highlight:yellow'>+=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 return prog-&gt;aux-&gt;__id;<o:p></o:p></span></strong>=
</pre><pre><strong><span style=3D'font-family:"Courier New";background:yell=
ow;mso-highlight:yellow'>+}<o:p></o:p></span></strong></pre><pre><strong><s=
pan style=3D'font-family:"Courier New";background:yellow;mso-highlight:yell=
ow'> void bpf_prog_free_id(struct bpf_prog *prog, bool do_idr_lock);<o:p></=
o:p></span></strong></pre><pre><strong><span style=3D'font-family:"Courier =
New";background:yellow;mso-highlight:yellow'> void bpf_map_free_id(struct b=
pf_map *map, bool do_idr_lock);<o:p></o:p></span></strong></pre><pre><stron=
g><span style=3D'font-family:"Courier New";background:yellow;mso-highlight:=
yellow'> <o:p></o:p></span></strong></pre><pre><strong><span style=3D'font-=
family:"Courier New";background:yellow;mso-highlight:yellow'>diff --git a/i=
nclude/linux/bpf_verifier.h b/include/linux/bpf_verifier.h<o:p></o:p></span=
></strong></pre><pre><strong><span style=3D'font-family:"Courier New";backg=
round:yellow;mso-highlight:yellow'>index 9e1e6965f407..525c02cc12ea 100644<=
o:p></o:p></span></strong></pre><pre><strong><span style=3D'font-family:"Co=
urier New";background:yellow;mso-highlight:yellow'>--- a/include/linux/bpf_=
verifier.h<o:p></o:p></span></strong></pre><pre><strong><span style=3D'font=
-family:"Courier New";background:yellow;mso-highlight:yellow'>+++ b/include=
/linux/bpf_verifier.h<o:p></o:p></span></strong></pre><pre><strong><span st=
yle=3D'font-family:"Courier New";background:yellow;mso-highlight:yellow'>@@=
 -604,7 +604,7 @@ static inline u64 bpf_trampoline_compute_key(const struct=
 bpf_prog *tgt_prog,<o:p></o:p></span></strong></pre><pre><strong><span sty=
le=3D'font-family:"Courier New";background:yellow;mso-highlight:yellow'> =
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0struct btf *btf, u32 btf_id)<o:p></o:p></span></str=
ong></pre><pre><strong><span style=3D'font-family:"Courier New";background:=
yellow;mso-highlight:yellow'> {<o:p></o:p></span></strong></pre><pre><stron=
g><span style=3D'font-family:"Courier New";background:yellow;mso-highlight:=
yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (tgt_prog)<o:p></o:p></spa=
n></strong></pre><pre><strong><span style=3D'font-family:"Courier New";back=
ground:yellow;mso-highlight:yellow'>-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ((u64)tgt_prog-&gt;aux-&g=
t;id &lt;&lt; 32) | btf_id;<o:p></o:p></span></strong></pre><pre><strong><s=
pan style=3D'font-family:"Courier New";background:yellow;mso-highlight:yell=
ow'>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 return ((u64)bpf_prog_get_id(tgt_prog) &lt;&lt; 32) | btf_id;<o:p=
></o:p></span></strong></pre><pre><strong><span style=3D'font-family:"Couri=
er New";background:yellow;mso-highlight:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 else<o:p></o:p></span></strong></pre><pre><strong><span style=
=3D'font-family:"Courier New";background:yellow;mso-highlight:yellow'> =C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 return ((u64)btf_obj_id(btf) &lt;&lt; 32) | 0x80000000 | btf_id;<o:p></o:p=
></span></strong></pre><pre><strong><span style=3D'font-family:"Courier New=
";background:yellow;mso-highlight:yellow'> }<o:p></o:p></span></strong></pr=
e><pre><strong><span style=3D'font-family:"Courier New";background:yellow;m=
so-highlight:yellow'>diff --git a/include/trace/events/xdp.h b/include/trac=
e/events/xdp.h<o:p></o:p></span></strong></pre><pre><strong><span style=3D'=
font-family:"Courier New";background:yellow;mso-highlight:yellow'>index c40=
fc97f9417..a1c3048872ea 100644<o:p></o:p></span></strong></pre><pre><strong=
><span style=3D'font-family:"Courier New";background:yellow;mso-highlight:y=
ellow'>--- a/include/trace/events/xdp.h<o:p></o:p></span></strong></pre><pr=
e><strong><span style=3D'font-family:"Courier New";background:yellow;mso-hi=
ghlight:yellow'>+++ b/include/trace/events/xdp.h<o:p></o:p></span></strong>=
</pre><pre><strong><span style=3D'font-family:"Courier New";background:yell=
ow;mso-highlight:yellow'>@@ -39,7 +39,7 @@ TRACE_EVENT(xdp_exception,<o:p><=
/o:p></span></strong></pre><pre><strong><span style=3D'font-family:"Courier=
 New";background:yellow;mso-highlight:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 ),<o:p></o:p></span></strong></pre><pre><strong><span style=3D'fo=
nt-family:"Courier New";background:yellow;mso-highlight:yellow'> <o:p></o:p=
></span></strong></pre><pre><strong><span style=3D'font-family:"Courier New=
";background:yellow;mso-highlight:yellow'>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 TP_fast_assign(<o:p></o:p></span></strong></pre><pre><strong><spa=
n style=3D'font-family:"Courier New";background:yellow;mso-highlight:yellow=
'>-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 __entry-&gt;prog_id=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D xdp-&gt;=
aux-&gt;id;<o:p></o:p></span></strong></pre><pre><strong><span style=3D'fon=
t-family:"Courier New";background:yellow;mso-highlight:yellow'>+=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __ent=
ry-&gt;prog_id=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D (xdp-&gt;valid_id ? =
xdp-&gt;aux-&gt;__id : 0);<o:p></o:p></span></strong></pre><pre><strong><sp=
an style=3D'font-family:"Courier New";background:yellow;mso-highlight:yello=
w'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 __entry-&gt;act=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 =3D act;<o:p></o:p></span></strong></pre><pre><strong><span st=
yle=3D'font-family:"Courier New";background:yellow;mso-highlight:yellow'> =
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 __entry-&gt;ifindex=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D dev-&gt;ifi=
ndex;<o:p></o:p></span></strong></pre><pre><strong><span style=3D'font-fami=
ly:"Courier New";background:yellow;mso-highlight:yellow'> =C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 ),<o:p></o:p></span></strong></pre><pre><strong><span=
 style=3D'font-family:"Courier New";background:yellow;mso-highlight:yellow'=
>@@ -120,7 +120,7 @@ DECLARE_EVENT_CLASS(xdp_redirect_template,<o:p></o:p><=
/span></strong></pre><pre><strong><span style=3D'font-family:"Courier New";=
background:yellow;mso-highlight:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 map_index =3D 0;<o:p></o:p></span></strong></pre><pre><s=
trong><span style=3D'font-family:"Courier New";background:yellow;mso-highli=
ght:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 }<o:p></o:p></span></strong></pre><pre><strong><span sty=
le=3D'font-family:"Courier New";background:yellow;mso-highlight:yellow'> <o=
:p></o:p></span></strong></pre><pre><strong><span style=3D'font-family:"Cou=
rier New";background:yellow;mso-highlight:yellow'>-=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry-&gt;prog_id=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D xdp-&gt;aux-&gt;id;<o:p></o:p></sp=
an></strong></pre><pre><strong><span style=3D'font-family:"Courier New";bac=
kground:yellow;mso-highlight:yellow'>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry-&gt;prog_id=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 =3D (xdp-&gt;valid_id ? xdp-&gt;aux-&gt;__id : 0);=
<o:p></o:p></span></strong></pre><pre><strong><span style=3D'font-family:"C=
ourier New";background:yellow;mso-highlight:yellow'> =C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry-&gt;act=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D XDP_REDIRE=
CT;<o:p></o:p></span></strong></pre><pre><strong><span style=3D'font-family=
:"Courier New";background:yellow;mso-highlight:yellow'> =C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry-&gt;if=
index=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D dev-&gt;ifindex;<o:p></o:p></=
span></strong></pre><pre><strong><span style=3D'font-family:"Courier New";b=
ackground:yellow;mso-highlight:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry-&gt;err=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D err;<o:p></o:p></span>=
</strong></pre><pre><strong><span style=3D'font-family:"Courier New";backgr=
ound:yellow;mso-highlight:yellow'>diff --git a/kernel/bpf/arraymap.c b/kern=
el/bpf/arraymap.c<o:p></o:p></span></strong></pre><pre><strong><span style=
=3D'font-family:"Courier New";background:yellow;mso-highlight:yellow'>index=
 832b2659e96e..d19db5980b1b 100644<o:p></o:p></span></strong></pre><pre><st=
rong><span style=3D'font-family:"Courier New";background:yellow;mso-highlig=
ht:yellow'>--- a/kernel/bpf/arraymap.c<o:p></o:p></span></strong></pre><pre=
><strong><span style=3D'font-family:"Courier New";background:yellow;mso-hig=
hlight:yellow'>+++ b/kernel/bpf/arraymap.c<o:p></o:p></span></strong></pre>=
<pre><strong><span style=3D'font-family:"Courier New";background:yellow;mso=
-highlight:yellow'>@@ -905,7 +905,7 @@ static void prog_fd_array_put_ptr(vo=
id *ptr)<o:p></o:p></span></strong></pre><pre><strong><span style=3D'font-f=
amily:"Courier New";background:yellow;mso-highlight:yellow'> <o:p></o:p></s=
pan></strong></pre><pre><strong><span style=3D'font-family:"Courier New";ba=
ckground:yellow;mso-highlight:yellow'>=C2=A0static u32 prog_fd_array_sys_lo=
okup_elem(void *ptr)<o:p></o:p></span></strong></pre><pre><strong><span sty=
le=3D'font-family:"Courier New";background:yellow;mso-highlight:yellow'> {<=
o:p></o:p></span></strong></pre><pre><strong><span style=3D'font-family:"Co=
urier New";background:yellow;mso-highlight:yellow'>-=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 return ((struct bpf_prog *)ptr)-&gt;aux-&gt;id;<o:p></o:p><=
/span></strong></pre><pre><strong><span style=3D'font-family:"Courier New";=
background:yellow;mso-highlight:yellow'>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 return bpf_prog_get_id((struct bpf_prog *)ptr);<o:p></o:p></span></stro=
ng></pre><pre><strong><span style=3D'font-family:"Courier New";background:y=
ellow;mso-highlight:yellow'> }<o:p></o:p></span></strong></pre><pre><strong=
><span style=3D'font-family:"Courier New";background:yellow;mso-highlight:y=
ellow'> <o:p></o:p></span></strong></pre><pre><strong><span style=3D'font-f=
amily:"Courier New";background:yellow;mso-highlight:yellow'>=C2=A0/* decrem=
ent refcnt of all bpf_progs that are stored in this map */<o:p></o:p></span=
></strong></pre><pre><strong><span style=3D'font-family:"Courier New";backg=
round:yellow;mso-highlight:yellow'>diff --git a/kernel/bpf/bpf_struct_ops.c=
 b/kernel/bpf/bpf_struct_ops.c<o:p></o:p></span></strong></pre><pre><strong=
><span style=3D'font-family:"Courier New";background:yellow;mso-highlight:y=
ellow'>index 84b2d9dba79a..6c20e6cd9442 100644<o:p></o:p></span></strong></=
pre><pre><strong><span style=3D'font-family:"Courier New";background:yellow=
;mso-highlight:yellow'>--- a/kernel/bpf/bpf_struct_ops.c<o:p></o:p></span><=
/strong></pre><pre><strong><span style=3D'font-family:"Courier New";backgro=
und:yellow;mso-highlight:yellow'>+++ b/kernel/bpf/bpf_struct_ops.c<o:p></o:=
p></span></strong></pre><pre><strong><span style=3D'font-family:"Courier Ne=
w";background:yellow;mso-highlight:yellow'>@@ -488,7 +488,7 @@ static int b=
pf_struct_ops_map_update_elem(struct bpf_map *map, void *key,<o:p></o:p></s=
pan></strong></pre><pre><strong><span style=3D'font-family:"Courier New";ba=
ckground:yellow;mso-highlight:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 image +=3D err;<o:p></o:p></span=
></strong></pre><pre><strong><span style=3D'font-family:"Courier New";backg=
round:yellow;mso-highlight:yellow'> <o:p></o:p></span></strong></pre><pre><=
strong><span style=3D'font-family:"Courier New";background:yellow;mso-highl=
ight:yellow'>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 /* put prog_id to udata */<o:p></o:p></span></stro=
ng></pre><pre><strong><span style=3D'font-family:"Courier New";background:y=
ellow;mso-highlight:yellow'>-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *(unsigned long *)(udata + moff) =3D prog=
-&gt;aux-&gt;id;<o:p></o:p></span></strong></pre><pre><strong><span style=
=3D'font-family:"Courier New";background:yellow;mso-highlight:yellow'>+=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 *(unsigned long *)(udata + moff) =3D bpf_prog_get_id(prog);<o:p></o:p></sp=
an></strong></pre><pre><strong><span style=3D'font-family:"Courier New";bac=
kground:yellow;mso-highlight:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
}<o:p></o:p></span></strong></pre><pre><strong><span style=3D'font-family:"=
Courier New";background:yellow;mso-highlight:yellow'> <o:p></o:p></span></s=
trong></pre><pre><strong><span style=3D'font-family:"Courier New";backgroun=
d:yellow;mso-highlight:yellow'>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 r=
efcount_set(&amp;kvalue-&gt;refcnt, 1);<o:p></o:p></span></strong></pre><pr=
e><strong><span style=3D'font-family:"Courier New";background:yellow;mso-hi=
ghlight:yellow'>diff --git a/kernel/bpf/cgroup.c b/kernel/bpf/cgroup.c<o:p>=
</o:p></span></strong></pre><pre><strong><span style=3D'font-family:"Courie=
r New";background:yellow;mso-highlight:yellow'>index bf2fdb33fb31..4a8d26f1=
d5d1 100644<o:p></o:p></span></strong></pre><pre><strong><span style=3D'fon=
t-family:"Courier New";background:yellow;mso-highlight:yellow'>--- a/kernel=
/bpf/cgroup.c<o:p></o:p></span></strong></pre><pre><strong><span style=3D'f=
ont-family:"Courier New";background:yellow;mso-highlight:yellow'>+++ b/kern=
el/bpf/cgroup.c<o:p></o:p></span></strong></pre><pre><strong><span style=3D=
'font-family:"Courier New";background:yellow;mso-highlight:yellow'>@@ -1091=
,7 +1091,7 @@ static int __cgroup_bpf_query(struct cgroup *cgrp, const unio=
n bpf_attr *attr,<o:p></o:p></span></strong></pre><pre><strong><span style=
=3D'font-family:"Courier New";background:yellow;mso-highlight:yellow'> =C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 i =3D 0;<o:p></o:p></span>=
</strong></pre><pre><strong><span style=3D'font-family:"Courier New";backgr=
ound:yellow;mso-highlight:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 hlist_for_each_entry(pl, progs, node) {<o:p></o:p></span></str=
ong></pre><pre><strong><span style=3D'font-family:"Courier New";background:=
yellow;mso-highlight:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 prog =3D prog_list_p=
rog(pl);<o:p></o:p></span></strong></pre><pre><strong><span style=3D'font-f=
amily:"Courier New";background:yellow;mso-highlight:yellow'>-=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 id =3D prog-&gt;aux-&gt;id;<o:p></o:p></span></strong></pre><p=
re><strong><span style=3D'font-family:"Courier New";background:yellow;mso-h=
ighlight:yellow'>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 id =3D bpf_prog_get_id(prog);<o:=
p></o:p></span></strong></pre><pre><strong><span style=3D'font-family:"Cour=
ier New";background:yellow;mso-highlight:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 if (copy_to_user(prog_ids + i, &amp;id, sizeof(id)))<o:p></o:p></span></st=
rong></pre><pre><strong><span style=3D'font-family:"Courier New";background=
:yellow;mso-highlight:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 return -EFAULT;<o:p></o:p></span></strong></pre><p=
re><strong><span style=3D'font-family:"Courier New";background:yellow;mso-h=
ighlight:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (++i =3D=3D cnt)<o:p></o:p></=
span></strong></pre><pre><strong><span style=3D'font-family:"Courier New";b=
ackground:yellow;mso-highlight:yellow'>diff --git a/kernel/bpf/core.c b/ker=
nel/bpf/core.c<o:p></o:p></span></strong></pre><pre><strong><span style=3D'=
font-family:"Courier New";background:yellow;mso-highlight:yellow'>index 25a=
54e04560e..ea3938ab6f5b 100644<o:p></o:p></span></strong></pre><pre><strong=
><span style=3D'font-family:"Courier New";background:yellow;mso-highlight:y=
ellow'>--- a/kernel/bpf/core.c<o:p></o:p></span></strong></pre><pre><strong=
><span style=3D'font-family:"Courier New";background:yellow;mso-highlight:y=
ellow'>+++ b/kernel/bpf/core.c<o:p></o:p></span></strong></pre><pre><strong=
><span style=3D'font-family:"Courier New";background:yellow;mso-highlight:y=
ellow'>@@ -2293,7 +2293,7 @@ static bool bpf_prog_array_copy_core(struct bp=
f_prog_array *array,<o:p></o:p></span></strong></pre><pre><strong><span sty=
le=3D'font-family:"Courier New";background:yellow;mso-highlight:yellow'> =
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for (item =3D array-&gt;items; item-&g=
t;prog; item++) {<o:p></o:p></span></strong></pre><pre><strong><span style=
=3D'font-family:"Courier New";background:yellow;mso-highlight:yellow'> =C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 if (item-&gt;prog =3D=3D &amp;dummy_bpf_prog.prog)<o:p></o:p></span></stro=
ng></pre><pre><strong><span style=3D'font-family:"Courier New";background:y=
ellow;mso-highlight:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 continue;<o:p></o:p></span></strong></pre><pre><strong><span style=
=3D'font-family:"Courier New";background:yellow;mso-highlight:yellow'>-=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 prog_ids[i] =3D item-&gt;prog-&gt;aux-&gt;id;<o:p></o:p></span></strong></=
pre><pre><strong><span style=3D'font-family:"Courier New";background:yellow=
;mso-highlight:yellow'>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 prog_ids[i] =3D bpf_prog_get_id(item-&gt;prog);=
<o:p></o:p></span></strong></pre><pre><strong><span style=3D'font-family:"C=
ourier New";background:yellow;mso-highlight:yellow'> =C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (++i =3D=3D re=
quest_cnt) {<o:p></o:p></span></strong></pre><pre><strong><span style=3D'fo=
nt-family:"Courier New";background:yellow;mso-highlight:yellow'> =C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 item++;<o:p></o:p></span></stron=
g></pre><pre><strong><span style=3D'font-family:"Courier New";background:ye=
llow;mso-highlight:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 break;<o:p></o:p></span></strong></pre><pre><strong><span style=3D'f=
ont-family:"Courier New";background:yellow;mso-highlight:yellow'>diff --git=
 a/kernel/bpf/cpumap.c b/kernel/bpf/cpumap.c<o:p></o:p></span></strong></pr=
e><pre><strong><span style=3D'font-family:"Courier New";background:yellow;m=
so-highlight:yellow'>index b5ba34ddd4b6..3f3423d03aea 100644<o:p></o:p></sp=
an></strong></pre><pre><strong><span style=3D'font-family:"Courier New";bac=
kground:yellow;mso-highlight:yellow'>--- a/kernel/bpf/cpumap.c<o:p></o:p></=
span></strong></pre><pre><strong><span style=3D'font-family:"Courier New";b=
ackground:yellow;mso-highlight:yellow'>+++ b/kernel/bpf/cpumap.c<o:p></o:p>=
</span></strong></pre><pre><strong><span style=3D'font-family:"Courier New"=
;background:yellow;mso-highlight:yellow'>@@ -413,7 +413,7 @@ static int __c=
pu_map_load_bpf_program(struct bpf_cpu_map_entry *rcpu,<o:p></o:p></span></=
strong></pre><pre><strong><span style=3D'font-family:"Courier New";backgrou=
nd:yellow;mso-highlight:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EINVAL;<o:p></o:p></span></str=
ong></pre><pre><strong><span style=3D'font-family:"Courier New";background:=
yellow;mso-highlight:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }<o:p></=
o:p></span></strong></pre><pre><strong><span style=3D'font-family:"Courier =
New";background:yellow;mso-highlight:yellow'> <o:p></o:p></span></strong></=
pre><pre><strong><span style=3D'font-family:"Courier New";background:yellow=
;mso-highlight:yellow'>-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rcpu-&gt;value=
.bpf_prog.id =3D prog-&gt;aux-&gt;id;<o:p></o:p></span></strong></pre><pre>=
<strong><span style=3D'font-family:"Courier New";background:yellow;mso-high=
light:yellow'>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rcpu-&gt;value.bpf_prog=
.id =3D bpf_prog_get_id(prog);<o:p></o:p></span></strong></pre><pre><strong=
><span style=3D'font-family:"Courier New";background:yellow;mso-highlight:y=
ellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rcpu-&gt;prog =3D prog;<o:p></=
o:p></span></strong></pre><pre><strong><span style=3D'font-family:"Courier =
New";background:yellow;mso-highlight:yellow'> <o:p></o:p></span></strong></=
pre><pre><strong><span style=3D'font-family:"Courier New";background:yellow=
;mso-highlight:yellow'>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;=
<o:p></o:p></span></strong></pre><pre><strong><span style=3D'font-family:"C=
ourier New";background:yellow;mso-highlight:yellow'>diff --git a/kernel/bpf=
/devmap.c b/kernel/bpf/devmap.c<o:p></o:p></span></strong></pre><pre><stron=
g><span style=3D'font-family:"Courier New";background:yellow;mso-highlight:=
yellow'>index f9a87dcc5535..d46309d4aa9e 100644<o:p></o:p></span></strong><=
/pre><pre><strong><span style=3D'font-family:"Courier New";background:yello=
w;mso-highlight:yellow'>--- a/kernel/bpf/devmap.c<o:p></o:p></span></strong=
></pre><pre><strong><span style=3D'font-family:"Courier New";background:yel=
low;mso-highlight:yellow'>+++ b/kernel/bpf/devmap.c<o:p></o:p></span></stro=
ng></pre><pre><strong><span style=3D'font-family:"Courier New";background:y=
ellow;mso-highlight:yellow'>@@ -868,7 +868,7 @@ static struct bpf_dtab_netd=
ev *__dev_map_alloc_node(struct net *net,<o:p></o:p></span></strong></pre><=
pre><strong><span style=3D'font-family:"Courier New";background:yellow;mso-=
highlight:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev-&gt;dtab =3D dt=
ab;<o:p></o:p></span></strong></pre><pre><strong><span style=3D'font-family=
:"Courier New";background:yellow;mso-highlight:yellow'> =C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 if (prog) {<o:p></o:p></span></strong></pre><pre><strong=
><span style=3D'font-family:"Courier New";background:yellow;mso-highlight:y=
ellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 dev-&gt;xdp_prog =3D prog;<o:p></o:p></span></strong></pre><pr=
e><strong><span style=3D'font-family:"Courier New";background:yellow;mso-hi=
ghlight:yellow'>-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 dev-&gt;val.bpf_prog.id =3D prog-&gt;aux-&gt;id;<o:p>=
</o:p></span></strong></pre><pre><strong><span style=3D'font-family:"Courie=
r New";background:yellow;mso-highlight:yellow'>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev-&gt;val.bpf_prog.id=
 =3D bpf_prog_get_id(prog);<o:p></o:p></span></strong></pre><pre><strong><s=
pan style=3D'font-family:"Courier New";background:yellow;mso-highlight:yell=
ow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } else {<o:p></o:p></span></stron=
g></pre><pre><strong><span style=3D'font-family:"Courier New";background:ye=
llow;mso-highlight:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev-&gt;xdp_prog =3D NULL;<o:p></o:p></sp=
an></strong></pre><pre><strong><span style=3D'font-family:"Courier New";bac=
kground:yellow;mso-highlight:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev-&gt;val.bpf_prog.id =3D 0;<o=
:p></o:p></span></strong></pre><pre><strong><span style=3D'font-family:"Cou=
rier New";background:yellow;mso-highlight:yellow'>diff --git a/kernel/bpf/s=
yscall.c b/kernel/bpf/syscall.c<o:p></o:p></span></strong></pre><pre><stron=
g><span style=3D'font-family:"Courier New";background:yellow;mso-highlight:=
yellow'>index 7b373a5e861f..9e862ef792cb 100644<o:p></o:p></span></strong><=
/pre><pre><strong><span style=3D'font-family:"Courier New";background:yello=
w;mso-highlight:yellow'>--- a/kernel/bpf/syscall.c<o:p></o:p></span></stron=
g></pre><pre><strong><span style=3D'font-family:"Courier New";background:ye=
llow;mso-highlight:yellow'>+++ b/kernel/bpf/syscall.c<o:p></o:p></span></st=
rong></pre><pre><strong><span style=3D'font-family:"Courier New";background=
:yellow;mso-highlight:yellow'>@@ -1958,13 +1958,14 @@ static void bpf_audit=
_prog(const struct bpf_prog *prog, unsigned int op)<o:p></o:p></span></stro=
ng></pre><pre><strong><span style=3D'font-family:"Courier New";background:y=
ellow;mso-highlight:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;<o:p></o:p></span></strong></pre><=
pre><strong><span style=3D'font-family:"Courier New";background:yellow;mso-=
highlight:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (audit_enabled =
=3D=3D AUDIT_OFF)<o:p></o:p></span></strong></pre><pre><strong><span style=
=3D'font-family:"Courier New";background:yellow;mso-highlight:yellow'> =C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 return;<o:p></o:p></span></strong></pre><pre><strong><span style=3D'font-f=
amily:"Courier New";background:yellow;mso-highlight:yellow'>-=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 if (op =3D=3D BPF_AUDIT_LOAD)<o:p></o:p></span></s=
trong></pre><pre><strong><span style=3D'font-family:"Courier New";backgroun=
d:yellow;mso-highlight:yellow'>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!i=
n_irq() &amp;&amp; !irqs_disabled())<o:p></o:p></span></strong></pre><pre><=
strong><span style=3D'font-family:"Courier New";background:yellow;mso-highl=
ight:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 ctx =3D audit_context();<o:p></o:p></span></strong></pre=
><pre><strong><span style=3D'font-family:"Courier New";background:yellow;ms=
o-highlight:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ab =3D audit_log_=
start(ctx, GFP_ATOMIC, AUDIT_BPF);<o:p></o:p></span></strong></pre><pre><st=
rong><span style=3D'font-family:"Courier New";background:yellow;mso-highlig=
ht:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (unlikely(!ab))<o:p></o=
:p></span></strong></pre><pre><strong><span style=3D'font-family:"Courier N=
ew";background:yellow;mso-highlight:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;<o:p></o:p></span><=
/strong></pre><pre><strong><span style=3D'font-family:"Courier New";backgro=
und:yellow;mso-highlight:yellow'>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* l=
og the id regardless of bpf_prog::valid_id */<o:p></o:p></span></strong></p=
re><pre><strong><span style=3D'font-family:"Courier New";background:yellow;=
mso-highlight:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 audit_log_forma=
t(ab, &quot;prog-id=3D%u op=3D%s&quot;,<o:p></o:p></span></strong></pre><pr=
e><strong><span style=3D'font-family:"Courier New";background:yellow;mso-hi=
ghlight:yellow'>-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0  prog=
-&gt;aux-&gt;id, bpf_audit_str[op]);<o:p></o:p></span></strong></pre><pre><=
strong><span style=3D'font-family:"Courier New";background:yellow;mso-highl=
ight:yellow'>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0  prog-&g=
t;aux-&gt;__id, bpf_audit_str[op]);<o:p></o:p></span></strong></pre><pre><s=
trong><span style=3D'font-family:"Courier New";background:yellow;mso-highli=
ght:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 audit_log_end(ab);<o:p></=
o:p></span></strong></pre><pre><strong><span style=3D'font-family:"Courier =
New";background:yellow;mso-highlight:yellow'> }<o:p></o:p></span></strong><=
/pre><pre><strong><span style=3D'font-family:"Courier New";background:yello=
w;mso-highlight:yellow'> <o:p></o:p></span></strong></pre><pre><strong><spa=
n style=3D'font-family:"Courier New";background:yellow;mso-highlight:yellow=
'>@@ -1975,8 +1976,10 @@ static int bpf_prog_alloc_id(struct bpf_prog *prog=
)<o:p></o:p></span></strong></pre><pre><strong><span style=3D'font-family:"=
Courier New";background:yellow;mso-highlight:yellow'> =C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 idr_preload(GFP_KERNEL);<o:p></o:p></span></strong></pre><p=
re><strong><span style=3D'font-family:"Courier New";background:yellow;mso-h=
ighlight:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 spin_lock_bh(&amp;pr=
og_idr_lock);<o:p></o:p></span></strong></pre><pre><strong><span style=3D'f=
ont-family:"Courier New";background:yellow;mso-highlight:yellow'> =C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 id =3D idr_alloc_cyclic(&amp;prog_idr, prog, 1,=
 INT_MAX, GFP_ATOMIC);<o:p></o:p></span></strong></pre><pre><strong><span s=
tyle=3D'font-family:"Courier New";background:yellow;mso-highlight:yellow'>-=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (id &gt; 0)<o:p></o:p></span></stro=
ng></pre><pre><strong><span style=3D'font-family:"Courier New";background:y=
ellow;mso-highlight:yellow'>-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 prog-&gt;aux-&gt;id =3D id;<o:p></o:p></s=
pan></strong></pre><pre><strong><span style=3D'font-family:"Courier New";ba=
ckground:yellow;mso-highlight:yellow'>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 if (id &gt; 0) {<o:p></o:p></span></strong></pre><pre><strong><span style=
=3D'font-family:"Courier New";background:yellow;mso-highlight:yellow'>+=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 prog-&gt;aux-&gt;__id =3D id;<o:p></o:p></span></strong></pre><pre><strong=
><span style=3D'font-family:"Courier New";background:yellow;mso-highlight:y=
ellow'>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 prog-&gt;valid_id =3D true;<o:p></o:p></span></strong></pre><p=
re><strong><span style=3D'font-family:"Courier New";background:yellow;mso-h=
ighlight:yellow'>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }<o:p></o:p></span><=
/strong></pre><pre><strong><span style=3D'font-family:"Courier New";backgro=
und:yellow;mso-highlight:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 spin=
_unlock_bh(&amp;prog_idr_lock);<o:p></o:p></span></strong></pre><pre><stron=
g><span style=3D'font-family:"Courier New";background:yellow;mso-highlight:=
yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 idr_preload_end();<o:p></o:p>=
</span></strong></pre><pre><strong><span style=3D'font-family:"Courier New"=
;background:yellow;mso-highlight:yellow'> <o:p></o:p></span></strong></pre>=
<pre><strong><span style=3D'font-family:"Courier New";background:yellow;mso=
-highlight:yellow'>@@ -1996,7 +1999,7 @@ void bpf_prog_free_id(struct bpf_p=
rog *prog, bool do_idr_lock)<o:p></o:p></span></strong></pre><pre><strong><=
span style=3D'font-family:"Courier New";background:yellow;mso-highlight:yel=
low'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0* disappears - even if som=
eone grabs an fd to them they are unusable,<o:p></o:p></span></strong></pre=
><pre><strong><span style=3D'font-family:"Courier New";background:yellow;ms=
o-highlight:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0* simply wa=
iting for refcnt to drop to be freed.<o:p></o:p></span></strong></pre><pre>=
<strong><span style=3D'font-family:"Courier New";background:yellow;mso-high=
light:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0*/<o:p></o:p></sp=
an></strong></pre><pre><strong><span style=3D'font-family:"Courier New";bac=
kground:yellow;mso-highlight:yellow'>-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
if (!prog-&gt;aux-&gt;id)<o:p></o:p></span></strong></pre><pre><strong><spa=
n style=3D'font-family:"Courier New";background:yellow;mso-highlight:yellow=
'>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!prog-&gt;valid_id)<o:p></o:p><=
/span></strong></pre><pre><strong><span style=3D'font-family:"Courier New";=
background:yellow;mso-highlight:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;<o:p></o:p></span></st=
rong></pre><pre><strong><span style=3D'font-family:"Courier New";background=
:yellow;mso-highlight:yellow'> <o:p></o:p></span></strong></pre><pre><stron=
g><span style=3D'font-family:"Courier New";background:yellow;mso-highlight:=
yellow'>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (do_idr_lock)<o:p></o=
:p></span></strong></pre><pre><strong><span style=3D'font-family:"Courier N=
ew";background:yellow;mso-highlight:yellow'>@@ -2004,8 +2007,8 @@ void bpf_=
prog_free_id(struct bpf_prog *prog, bool do_idr_lock)<o:p></o:p></span></st=
rong></pre><pre><strong><span style=3D'font-family:"Courier New";background=
:yellow;mso-highlight:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else<o:=
p></o:p></span></strong></pre><pre><strong><span style=3D'font-family:"Cour=
ier New";background:yellow;mso-highlight:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __acquire(&amp;prog_=
idr_lock);<o:p></o:p></span></strong></pre><pre><strong><span style=3D'font=
-family:"Courier New";background:yellow;mso-highlight:yellow'> <o:p></o:p><=
/span></strong></pre><pre><strong><span style=3D'font-family:"Courier New";=
background:yellow;mso-highlight:yellow'>-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 idr_remove(&amp;prog_idr, prog-&gt;aux-&gt;id);<o:p></o:p></span></stro=
ng></pre><pre><strong><span style=3D'font-family:"Courier New";background:y=
ellow;mso-highlight:yellow'>-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 prog-&gt;=
aux-&gt;id =3D 0;<o:p></o:p></span></strong></pre><pre><strong><span style=
=3D'font-family:"Courier New";background:yellow;mso-highlight:yellow'>+=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 idr_remove(&amp;prog_idr, prog-&gt;aux-&g=
t;__id);<o:p></o:p></span></strong></pre><pre><strong><span style=3D'font-f=
amily:"Courier New";background:yellow;mso-highlight:yellow'>+=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 prog-&gt;valid_id =3D false;<o:p></o:p></span></st=
rong></pre><pre><strong><span style=3D'font-family:"Courier New";background=
:yellow;mso-highlight:yellow'> <o:p></o:p></span></strong></pre><pre><stron=
g><span style=3D'font-family:"Courier New";background:yellow;mso-highlight:=
yellow'>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (do_idr_lock)<o:p></o=
:p></span></strong></pre><pre><strong><span style=3D'font-family:"Courier N=
ew";background:yellow;mso-highlight:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 spin_unlock_irqrestore(&am=
p;prog_idr_lock, flags);<o:p></o:p></span></strong></pre><pre><strong><span=
 style=3D'font-family:"Courier New";background:yellow;mso-highlight:yellow'=
>@@ -2154,7 +2157,7 @@ static void bpf_prog_show_fdinfo(struct seq_file *m,=
 struct file *filp)<o:p></o:p></span></strong></pre><pre><strong><span styl=
e=3D'font-family:"Courier New";background:yellow;mso-highlight:yellow'> =C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 =C2=A0=C2=A0=C2=A0prog-&gt;jited,<o:p></o:p></span></strong></pre><pre><st=
rong><span style=3D'font-family:"Courier New";background:yellow;mso-highlig=
ht:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0prog_tag,<o:p></o:p></span></strong></pre=
><pre><strong><span style=3D'font-family:"Courier New";background:yellow;ms=
o-highlight:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0prog-&gt;pages * 1ULL &lt;&lt; P=
AGE_SHIFT,<o:p></o:p></span></strong></pre><pre><strong><span style=3D'font=
-family:"Courier New";background:yellow;mso-highlight:yellow'>-=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=
=C2=A0 prog-&gt;aux-&gt;id,<o:p></o:p></span></strong></pre><pre><strong><s=
pan style=3D'font-family:"Courier New";background:yellow;mso-highlight:yell=
ow'>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 =C2=A0=C2=A0 bpf_prog_get_id(prog),<o:p></o:p></span></strong></p=
re><pre><strong><span style=3D'font-family:"Courier New";background:yellow;=
mso-highlight:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0stats.nsecs,<o:p></o:p></span=
></strong></pre><pre><strong><span style=3D'font-family:"Courier New";backg=
round:yellow;mso-highlight:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0stats.cnt,<o:p></=
o:p></span></strong></pre><pre><strong><span style=3D'font-family:"Courier =
New";background:yellow;mso-highlight:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0stats=
.misses,<o:p></o:p></span></strong></pre><pre><strong><span style=3D'font-f=
amily:"Courier New";background:yellow;mso-highlight:yellow'>@@ -2786,7 +278=
9,7 @@ static void bpf_link_show_fdinfo(struct seq_file *m, struct file *fi=
lp)<o:p></o:p></span></strong></pre><pre><strong><span style=3D'font-family=
:"Courier New";background:yellow;mso-highlight:yellow'> =C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=
=C2=A0bpf_link_type_strs[link-&gt;type],<o:p></o:p></span></strong></pre><p=
re><strong><span style=3D'font-family:"Courier New";background:yellow;mso-h=
ighlight:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0link-&gt;id,<o:p></o:p></span></str=
ong></pre><pre><strong><span style=3D'font-family:"Courier New";background:=
yellow;mso-highlight:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0prog_tag,<o:p></o:p></s=
pan></strong></pre><pre><strong><span style=3D'font-family:"Courier New";ba=
ckground:yellow;mso-highlight:yellow'>-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0 prog-&gt;aux-&gt;id=
);<o:p></o:p></span></strong></pre><pre><strong><span style=3D'font-family:=
"Courier New";background:yellow;mso-highlight:yellow'>+=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0 b=
pf_prog_get_id(prog));<o:p></o:p></span></strong></pre><pre><strong><span s=
tyle=3D'font-family:"Courier New";background:yellow;mso-highlight:yellow'> =
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (link-&gt;ops-&gt;show_fdinfo)<o:p>=
</o:p></span></strong></pre><pre><strong><span style=3D'font-family:"Courie=
r New";background:yellow;mso-highlight:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 link-&gt;ops-&gt;show_f=
dinfo(link, m);<o:p></o:p></span></strong></pre><pre><strong><span style=3D=
'font-family:"Courier New";background:yellow;mso-highlight:yellow'> }<o:p><=
/o:p></span></strong></pre><pre><strong><span style=3D'font-family:"Courier=
 New";background:yellow;mso-highlight:yellow'>@@ -3914,7 +3917,7 @@ static =
int bpf_prog_get_info_by_fd(struct file *file,<o:p></o:p></span></strong></=
pre><pre><strong><span style=3D'font-family:"Courier New";background:yellow=
;mso-highlight:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EFAULT;<o:p></o:p></span></strong></pre=
><pre><strong><span style=3D'font-family:"Courier New";background:yellow;ms=
o-highlight:yellow'> <o:p></o:p></span></strong></pre><pre><strong><span st=
yle=3D'font-family:"Courier New";background:yellow;mso-highlight:yellow'>=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 info.type =3D prog-&gt;type;<o:p=
></o:p></span></strong></pre><pre><strong><span style=3D'font-family:"Couri=
er New";background:yellow;mso-highlight:yellow'>-=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 info.id =3D prog-&gt;aux-&gt;id;<o:p></o:p></span></strong></p=
re><pre><strong><span style=3D'font-family:"Courier New";background:yellow;=
mso-highlight:yellow'>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 info.id =3D bpf=
_prog_get_id(prog);<o:p></o:p></span></strong></pre><pre><strong><span styl=
e=3D'font-family:"Courier New";background:yellow;mso-highlight:yellow'> =C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 info.load_time =3D prog-&gt;aux-&gt;load_=
time;<o:p></o:p></span></strong></pre><pre><strong><span style=3D'font-fami=
ly:"Courier New";background:yellow;mso-highlight:yellow'> =C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 info.created_by_uid =3D from_kuid_munged(current_user=
_ns(),<o:p></o:p></span></strong></pre><pre><strong><span style=3D'font-fam=
ily:"Courier New";background:yellow;mso-highlight:yellow'> =C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0prog-&gt;aux-&gt;user-&gt;uid);<o:p></o:p></span></str=
ong></pre><pre><strong><span style=3D'font-family:"Courier New";background:=
yellow;mso-highlight:yellow'>@@ -4261,7 +4264,7 @@ static int bpf_link_get_=
info_by_fd(struct file *file,<o:p></o:p></span></strong></pre><pre><strong>=
<span style=3D'font-family:"Courier New";background:yellow;mso-highlight:ye=
llow'> <o:p></o:p></span></strong></pre><pre><strong><span style=3D'font-fa=
mily:"Courier New";background:yellow;mso-highlight:yellow'>=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 info.type =3D link-&gt;type;<o:p></o:p></span><=
/strong></pre><pre><strong><span style=3D'font-family:"Courier New";backgro=
und:yellow;mso-highlight:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 info=
.id =3D link-&gt;id;<o:p></o:p></span></strong></pre><pre><strong><span sty=
le=3D'font-family:"Courier New";background:yellow;mso-highlight:yellow'>-=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 info.prog_id =3D link-&gt;prog-&gt;aux=
-&gt;id;<o:p></o:p></span></strong></pre><pre><strong><span style=3D'font-f=
amily:"Courier New";background:yellow;mso-highlight:yellow'>+=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 info.prog_id =3D bpf_prog_get_id(link-&gt;prog);<o=
:p></o:p></span></strong></pre><pre><strong><span style=3D'font-family:"Cou=
rier New";background:yellow;mso-highlight:yellow'> <o:p></o:p></span></stro=
ng></pre><pre><strong><span style=3D'font-family:"Courier New";background:y=
ellow;mso-highlight:yellow'>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (=
link-&gt;ops-&gt;fill_link_info) {<o:p></o:p></span></strong></pre><pre><st=
rong><span style=3D'font-family:"Courier New";background:yellow;mso-highlig=
ht:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 err =3D link-&gt;ops-&gt;fill_link_info(link, &amp;info);<o=
:p></o:p></span></strong></pre><pre><strong><span style=3D'font-family:"Cou=
rier New";background:yellow;mso-highlight:yellow'>@@ -4426,7 +4429,7 @@ sta=
tic int bpf_task_fd_query(const union bpf_attr *attr,<o:p></o:p></span></st=
rong></pre><pre><strong><span style=3D'font-family:"Courier New";background=
:yellow;mso-highlight:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 struct bpf_raw_event_map *btp =3D raw_tp-&gt;btp;<o:p></o:p></spa=
n></strong></pre><pre><strong><span style=3D'font-family:"Courier New";back=
ground:yellow;mso-highlight:yellow'> <o:p></o:p></span></strong></pre><pre>=
<strong><span style=3D'font-family:"Courier New";background:yellow;mso-high=
light:yellow'>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 er=
r =3D bpf_task_fd_query_copy(attr, uattr,<o:p></o:p></span></strong></pre><=
pre><strong><span style=3D'font-family:"Courier New";background:yellow;mso-=
highlight:yellow'>-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=
=C2=A0=C2=A0 raw_tp-&gt;link.prog-&gt;aux-&gt;id,<o:p></o:p></span></strong=
></pre><pre><strong><span style=3D'font-family:"Courier New";background:yel=
low;mso-highlight:yellow'>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=
=C2=A0=C2=A0=C2=A0 bpf_prog_get_id(raw_tp-&gt;link.prog),<o:p></o:p></span>=
</strong></pre><pre><strong><span style=3D'font-family:"Courier New";backgr=
ound:yellow;mso-highlight:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0BPF_FD_TYPE_RAW_TRACEPOINT,<o:p></o:p></span=
></strong></pre><pre><strong><span style=3D'font-family:"Courier New";backg=
round:yellow;mso-highlight:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0btp-&gt;tp-&gt;name, 0, 0);<o:p></o:p></span=
></strong></pre><pre><strong><span style=3D'font-family:"Courier New";backg=
round:yellow;mso-highlight:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 goto put_file;<o:p></o:p></span></strong></pre><pre><strong><s=
pan style=3D'font-family:"Courier New";background:yellow;mso-highlight:yell=
ow'>diff --git a/kernel/events/core.c b/kernel/events/core.c<o:p></o:p></sp=
an></strong></pre><pre><strong><span style=3D'font-family:"Courier New";bac=
kground:yellow;mso-highlight:yellow'>index aefc1e08e015..c24e897d27f1 10064=
4<o:p></o:p></span></strong></pre><pre><strong><span style=3D'font-family:"=
Courier New";background:yellow;mso-highlight:yellow'>--- a/kernel/events/co=
re.c<o:p></o:p></span></strong></pre><pre><strong><span style=3D'font-famil=
y:"Courier New";background:yellow;mso-highlight:yellow'>+++ b/kernel/events=
/core.c<o:p></o:p></span></strong></pre><pre><strong><span style=3D'font-fa=
mily:"Courier New";background:yellow;mso-highlight:yellow'>@@ -9001,7 +9001=
,11 @@ void perf_event_bpf_event(struct bpf_prog *prog,<o:p></o:p></span></=
strong></pre><pre><strong><span style=3D'font-family:"Courier New";backgrou=
nd:yellow;mso-highlight:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 },<o:p></o:p></span></strong></pre><pre><strong><span style=3D'fo=
nt-family:"Courier New";background:yellow;mso-highlight:yellow'> =C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .type =3D type,<o:p></o:p></span=
></strong></pre><pre><strong><span style=3D'font-family:"Courier New";backg=
round:yellow;mso-highlight:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 .flags =3D flags,<o:p></o:p></span></strong></pre><pre><strong=
><span style=3D'font-family:"Courier New";background:yellow;mso-highlight:y=
ellow'>-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .id =3D prog-&=
gt;aux-&gt;id,<o:p></o:p></span></strong></pre><pre><strong><span style=3D'=
font-family:"Courier New";background:yellow;mso-highlight:yellow'>+=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*<o:p></o:p></span></strong>=
</pre><pre><strong><span style=3D'font-family:"Courier New";background:yell=
ow;mso-highlight:yellow'>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0  * don't use bpf_prog_get_id() as the id may be marked<o:p></o:p></span=
></strong></pre><pre><strong><span style=3D'font-family:"Courier New";backg=
round:yellow;mso-highlight:yellow'>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0  * invalid on PERF_BPF_EVENT_PROG_UNLOAD events<o:p></o:p></sp=
an></strong></pre><pre><strong><span style=3D'font-family:"Courier New";bac=
kground:yellow;mso-highlight:yellow'>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0  */<o:p></o:p></span></strong></pre><pre><strong><span styl=
e=3D'font-family:"Courier New";background:yellow;mso-highlight:yellow'>+=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .id =3D prog-&gt;aux-&gt;_=
_id,<o:p></o:p></span></strong></pre><pre><strong><span style=3D'font-famil=
y:"Courier New";background:yellow;mso-highlight:yellow'> =C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },<o:p></o:p><=
/span></strong></pre><pre><strong><span style=3D'font-family:"Courier New";=
background:yellow;mso-highlight:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 };<o:p></o:p></span></strong></pre><pre><strong><span style=3D'font-fam=
ily:"Courier New";background:yellow;mso-highlight:yellow'> <o:p></o:p></spa=
n></strong></pre><pre><strong><span style=3D'font-family:"Courier New";back=
ground:yellow;mso-highlight:yellow'>diff --git a/kernel/trace/bpf_trace.c b=
/kernel/trace/bpf_trace.c<o:p></o:p></span></strong></pre><pre><strong><spa=
n style=3D'font-family:"Courier New";background:yellow;mso-highlight:yellow=
'>index 49fb9ec8366d..7cd0eb83b137 100644<o:p></o:p></span></strong></pre><=
pre><strong><span style=3D'font-family:"Courier New";background:yellow;mso-=
highlight:yellow'>--- a/kernel/trace/bpf_trace.c<o:p></o:p></span></strong>=
</pre><pre><strong><span style=3D'font-family:"Courier New";background:yell=
ow;mso-highlight:yellow'>+++ b/kernel/trace/bpf_trace.c<o:p></o:p></span></=
strong></pre><pre><strong><span style=3D'font-family:"Courier New";backgrou=
nd:yellow;mso-highlight:yellow'>@@ -2344,7 +2344,7 @@ int bpf_get_perf_even=
t_info(const struct perf_event *event, u32 *prog_id,<o:p></o:p></span></str=
ong></pre><pre><strong><span style=3D'font-family:"Courier New";background:=
yellow;mso-highlight:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (prog=
-&gt;type =3D=3D BPF_PROG_TYPE_PERF_EVENT)<o:p></o:p></span></strong></pre>=
<pre><strong><span style=3D'font-family:"Courier New";background:yellow;mso=
-highlight:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 return -EOPNOTSUPP;<o:p></o:p></span></strong></pr=
e><pre><strong><span style=3D'font-family:"Courier New";background:yellow;m=
so-highlight:yellow'> <o:p></o:p></span></strong></pre><pre><strong><span s=
tyle=3D'font-family:"Courier New";background:yellow;mso-highlight:yellow'>-=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *prog_id =3D prog-&gt;aux-&gt;id;<o:p>=
</o:p></span></strong></pre><pre><strong><span style=3D'font-family:"Courie=
r New";background:yellow;mso-highlight:yellow'>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 *prog_id =3D bpf_prog_get_id(prog);<o:p></o:p></span></strong></p=
re><pre><strong><span style=3D'font-family:"Courier New";background:yellow;=
mso-highlight:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 flags =3D event=
-&gt;tp_event-&gt;flags;<o:p></o:p></span></strong></pre><pre><strong><span=
 style=3D'font-family:"Courier New";background:yellow;mso-highlight:yellow'=
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 is_tracepoint =3D flags &amp; TRACE_=
EVENT_FL_TRACEPOINT;<o:p></o:p></span></strong></pre><pre><strong><span sty=
le=3D'font-family:"Courier New";background:yellow;mso-highlight:yellow'> =
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 is_syscall_tp =3D is_syscall_trace_eve=
nt(event-&gt;tp_event);<o:p></o:p></span></strong></pre><pre><strong><span =
style=3D'font-family:"Courier New";background:yellow;mso-highlight:yellow'>=
diff --git a/net/core/dev.c b/net/core/dev.c<o:p></o:p></span></strong></pr=
e><pre><strong><span style=3D'font-family:"Courier New";background:yellow;m=
so-highlight:yellow'>index fa53830d0683..0d39ef22cf4b 100644<o:p></o:p></sp=
an></strong></pre><pre><strong><span style=3D'font-family:"Courier New";bac=
kground:yellow;mso-highlight:yellow'>--- a/net/core/dev.c<o:p></o:p></span>=
</strong></pre><pre><strong><span style=3D'font-family:"Courier New";backgr=
ound:yellow;mso-highlight:yellow'>+++ b/net/core/dev.c<o:p></o:p></span></s=
trong></pre><pre><strong><span style=3D'font-family:"Courier New";backgroun=
d:yellow;mso-highlight:yellow'>@@ -9068,7 +9068,7 @@ u32 dev_xdp_prog_id(st=
ruct net_device *dev, enum bpf_xdp_mode mode)<o:p></o:p></span></strong></p=
re><pre><strong><span style=3D'font-family:"Courier New";background:yellow;=
mso-highlight:yellow'> {<o:p></o:p></span></strong></pre><pre><strong><span=
 style=3D'font-family:"Courier New";background:yellow;mso-highlight:yellow'=
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct bpf_prog *prog =3D dev_xdp_pr=
og(dev, mode);<o:p></o:p></span></strong></pre><pre><strong><span style=3D'=
font-family:"Courier New";background:yellow;mso-highlight:yellow'> <o:p></o=
:p></span></strong></pre><pre><strong><span style=3D'font-family:"Courier N=
ew";background:yellow;mso-highlight:yellow'>-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 return prog ? prog-&gt;aux-&gt;id : 0;<o:p></o:p></span></strong></p=
re><pre><strong><span style=3D'font-family:"Courier New";background:yellow;=
mso-highlight:yellow'>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return prog ? b=
pf_prog_get_id(prog) : 0;<o:p></o:p></span></strong></pre><pre><strong><spa=
n style=3D'font-family:"Courier New";background:yellow;mso-highlight:yellow=
'> }<o:p></o:p></span></strong></pre><pre><strong><span style=3D'font-famil=
y:"Courier New";background:yellow;mso-highlight:yellow'> <o:p></o:p></span>=
</strong></pre><pre><strong><span style=3D'font-family:"Courier New";backgr=
ound:yellow;mso-highlight:yellow'>=C2=A0static void dev_xdp_set_link(struct=
 net_device *dev, enum bpf_xdp_mode mode,<o:p></o:p></span></strong></pre><=
pre><strong><span style=3D'font-family:"Courier New";background:yellow;mso-=
highlight:yellow'>diff --git a/net/core/filter.c b/net/core/filter.c<o:p></=
o:p></span></strong></pre><pre><strong><span style=3D'font-family:"Courier =
New";background:yellow;mso-highlight:yellow'>index bb0136e7a8e4..282ccfe34c=
ed 100644<o:p></o:p></span></strong></pre><pre><strong><span style=3D'font-=
family:"Courier New";background:yellow;mso-highlight:yellow'>--- a/net/core=
/filter.c<o:p></o:p></span></strong></pre><pre><strong><span style=3D'font-=
family:"Courier New";background:yellow;mso-highlight:yellow'>+++ b/net/core=
/filter.c<o:p></o:p></span></strong></pre><pre><strong><span style=3D'font-=
family:"Courier New";background:yellow;mso-highlight:yellow'>@@ -8729,7 +87=
29,8 @@ void bpf_warn_invalid_xdp_action(struct net_device *dev, struct bpf=
_prog *prog,<o:p></o:p></span></strong></pre><pre><strong><span style=3D'fo=
nt-family:"Courier New";background:yellow;mso-highlight:yellow'> <o:p></o:p=
></span></strong></pre><pre><strong><span style=3D'font-family:"Courier New=
";background:yellow;mso-highlight:yellow'>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 pr_warn_once(&quot;%s XDP return value %u on prog %s (id %d) dev =
%s, expect packet loss!\n&quot;,<o:p></o:p></span></strong></pre><pre><stro=
ng><span style=3D'font-family:"Courier New";background:yellow;mso-highlight=
:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0act &gt; act_max ? &quot;Ille=
gal&quot; : &quot;Driver unsupported&quot;,<o:p></o:p></span></strong></pre=
><pre><strong><span style=3D'font-family:"Courier New";background:yellow;ms=
o-highlight:yellow'>-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 act, prog-&gt;aux-&gt;nam=
e, prog-&gt;aux-&gt;id, dev ? dev-&gt;name : &quot;N/A&quot;);<o:p></o:p></=
span></strong></pre><pre><strong><span style=3D'font-family:"Courier New";b=
ackground:yellow;mso-highlight:yellow'>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 act,=
 prog-&gt;aux-&gt;name, bpf_prog_get_id(prog),<o:p></o:p></span></strong></=
pre><pre><strong><span style=3D'font-family:"Courier New";background:yellow=
;mso-highlight:yellow'>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 dev ? dev-&gt;name : &=
quot;N/A&quot;);<o:p></o:p></span></strong></pre><pre><strong><span style=
=3D'font-family:"Courier New";background:yellow;mso-highlight:yellow'> }<o:=
p></o:p></span></strong></pre><pre><strong><span style=3D'font-family:"Cour=
ier New";background:yellow;mso-highlight:yellow'> EXPORT_SYMBOL_GPL(bpf_war=
n_invalid_xdp_action);<o:p></o:p></span></strong></pre><pre><strong><span s=
tyle=3D'font-family:"Courier New";background:yellow;mso-highlight:yellow'> =
<o:p></o:p></span></strong></pre><pre><strong><span style=3D'font-family:"C=
ourier New";background:yellow;mso-highlight:yellow'>diff --git a/net/core/r=
tnetlink.c b/net/core/rtnetlink.c<o:p></o:p></span></strong></pre><pre><str=
ong><span style=3D'font-family:"Courier New";background:yellow;mso-highligh=
t:yellow'>index 74864dc46a7e..1f7e36909541 100644<o:p></o:p></span></strong=
></pre><pre><strong><span style=3D'font-family:"Courier New";background:yel=
low;mso-highlight:yellow'>--- a/net/core/rtnetlink.c<o:p></o:p></span></str=
ong></pre><pre><strong><span style=3D'font-family:"Courier New";background:=
yellow;mso-highlight:yellow'>+++ b/net/core/rtnetlink.c<o:p></o:p></span></=
strong></pre><pre><strong><span style=3D'font-family:"Courier New";backgrou=
nd:yellow;mso-highlight:yellow'>@@ -1453,7 +1453,7 @@ static u32 rtnl_xdp_p=
rog_skb(struct net_device *dev)<o:p></o:p></span></strong></pre><pre><stron=
g><span style=3D'font-family:"Courier New";background:yellow;mso-highlight:=
yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 generic_xdp_prog =3D rtnl_der=
eference(dev-&gt;xdp_prog);<o:p></o:p></span></strong></pre><pre><strong><s=
pan style=3D'font-family:"Courier New";background:yellow;mso-highlight:yell=
ow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!generic_xdp_prog)<o:p></o:p>=
</span></strong></pre><pre><strong><span style=3D'font-family:"Courier New"=
;background:yellow;mso-highlight:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;<o:p></o:p></span></=
strong></pre><pre><strong><span style=3D'font-family:"Courier New";backgrou=
nd:yellow;mso-highlight:yellow'>-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 retur=
n generic_xdp_prog-&gt;aux-&gt;id;<o:p></o:p></span></strong></pre><pre><st=
rong><span style=3D'font-family:"Courier New";background:yellow;mso-highlig=
ht:yellow'>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return bpf_prog_get_id(gen=
eric_xdp_prog);<o:p></o:p></span></strong></pre><pre><strong><span style=3D=
'font-family:"Courier New";background:yellow;mso-highlight:yellow'> }<o:p><=
/o:p></span></strong></pre><pre><strong><span style=3D'font-family:"Courier=
 New";background:yellow;mso-highlight:yellow'> <o:p></o:p></span></strong><=
/pre><pre><strong><span style=3D'font-family:"Courier New";background:yello=
w;mso-highlight:yellow'>=C2=A0static u32 rtnl_xdp_prog_drv(struct net_devic=
e *dev)<o:p></o:p></span></strong></pre><pre><strong><span style=3D'font-fa=
mily:"Courier New";background:yellow;mso-highlight:yellow'>diff --git a/net=
/core/sock_map.c b/net/core/sock_map.c<o:p></o:p></span></strong></pre><pre=
><strong><span style=3D'font-family:"Courier New";background:yellow;mso-hig=
hlight:yellow'>index a660baedd9e7..550ec6cb3aee 100644<o:p></o:p></span></s=
trong></pre><pre><strong><span style=3D'font-family:"Courier New";backgroun=
d:yellow;mso-highlight:yellow'>--- a/net/core/sock_map.c<o:p></o:p></span><=
/strong></pre><pre><strong><span style=3D'font-family:"Courier New";backgro=
und:yellow;mso-highlight:yellow'>+++ b/net/core/sock_map.c<o:p></o:p></span=
></strong></pre><pre><strong><span style=3D'font-family:"Courier New";backg=
round:yellow;mso-highlight:yellow'>@@ -1518,7 +1518,7 @@ int sock_map_bpf_p=
rog_query(const union bpf_attr *attr,<o:p></o:p></span></strong></pre><pre>=
<strong><span style=3D'font-family:"Courier New";background:yellow;mso-high=
light:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* we do not hold the r=
efcnt, the bpf prog may be released<o:p></o:p></span></strong></pre><pre><s=
trong><span style=3D'font-family:"Courier New";background:yellow;mso-highli=
ght:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0* asynchronously an=
d the id would be set to 0.<o:p></o:p></span></strong></pre><pre><strong><s=
pan style=3D'font-family:"Courier New";background:yellow;mso-highlight:yell=
ow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0*/<o:p></o:p></span></stron=
g></pre><pre><strong><span style=3D'font-family:"Courier New";background:ye=
llow;mso-highlight:yellow'>-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 id =3D dat=
a_race(prog-&gt;aux-&gt;id);<o:p></o:p></span></strong></pre><pre><strong><=
span style=3D'font-family:"Courier New";background:yellow;mso-highlight:yel=
low'>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 id =3D data_race(bpf_prog_get_id=
(prog));<o:p></o:p></span></strong></pre><pre><strong><span style=3D'font-f=
amily:"Courier New";background:yellow;mso-highlight:yellow'> =C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 if (id =3D=3D 0)<o:p></o:p></span></strong></pre><=
pre><strong><span style=3D'font-family:"Courier New";background:yellow;mso-=
highlight:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 prog_cnt =3D 0;<o:p></o:p></span></strong></pre><p=
re><strong><span style=3D'font-family:"Courier New";background:yellow;mso-h=
ighlight:yellow'> <o:p></o:p></span></strong></pre><pre><strong><span style=
=3D'font-family:"Courier New";background:yellow;mso-highlight:yellow'>diff =
--git a/net/ipv6/seg6_local.c b/net/ipv6/seg6_local.c<o:p></o:p></span></st=
rong></pre><pre><strong><span style=3D'font-family:"Courier New";background=
:yellow;mso-highlight:yellow'>index 8370726ae7bf..440ce3aba802 100644<o:p><=
/o:p></span></strong></pre><pre><strong><span style=3D'font-family:"Courier=
 New";background:yellow;mso-highlight:yellow'>--- a/net/ipv6/seg6_local.c<o=
:p></o:p></span></strong></pre><pre><strong><span style=3D'font-family:"Cou=
rier New";background:yellow;mso-highlight:yellow'>+++ b/net/ipv6/seg6_local=
.c<o:p></o:p></span></strong></pre><pre><strong><span style=3D'font-family:=
"Courier New";background:yellow;mso-highlight:yellow'>@@ -1543,7 +1543,8 @@=
 static int put_nla_bpf(struct sk_buff *skb, struct seg6_local_lwt *slwt)<o=
:p></o:p></span></strong></pre><pre><strong><span style=3D'font-family:"Cou=
rier New";background:yellow;mso-highlight:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 if (!nest)<o:p></o:p></span></strong></pre><pre><strong><span =
style=3D'font-family:"Courier New";background:yellow;mso-highlight:yellow'>=
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 return -EMSGSIZE;<o:p></o:p></span></strong></pre><pre><strong><span=
 style=3D'font-family:"Courier New";background:yellow;mso-highlight:yellow'=
> <o:p></o:p></span></strong></pre><pre><strong><span style=3D'font-family:=
"Courier New";background:yellow;mso-highlight:yellow'>-=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 if (nla_put_u32(skb, SEG6_LOCAL_BPF_PROG, slwt-&gt;bpf.p=
rog-&gt;aux-&gt;id))<o:p></o:p></span></strong></pre><pre><strong><span sty=
le=3D'font-family:"Courier New";background:yellow;mso-highlight:yellow'>+=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (nla_put_u32(skb, SEG6_LOCAL_BPF_PR=
OG,<o:p></o:p></span></strong></pre><pre><strong><span style=3D'font-family=
:"Courier New";background:yellow;mso-highlight:yellow'>+=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bpf_prog_get_id(slwt-&gt;bpf.prog)))<o:p>=
</o:p></span></strong></pre><pre><strong><span style=3D'font-family:"Courie=
r New";background:yellow;mso-highlight:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EMSGSIZE;<o:p><=
/o:p></span></strong></pre><pre><strong><span style=3D'font-family:"Courier=
 New";background:yellow;mso-highlight:yellow'> <o:p></o:p></span></strong><=
/pre><pre><strong><span style=3D'font-family:"Courier New";background:yello=
w;mso-highlight:yellow'>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (slwt=
-&gt;bpf.name &amp;&amp;<o:p></o:p></span></strong></pre><pre><strong><span=
 style=3D'font-family:"Courier New";background:yellow;mso-highlight:yellow'=
>diff --git a/net/sched/act_bpf.c b/net/sched/act_bpf.c<o:p></o:p></span></=
strong></pre><pre><strong><span style=3D'font-family:"Courier New";backgrou=
nd:yellow;mso-highlight:yellow'>index b79eee44e24e..604a29e482b0 100644<o:p=
></o:p></span></strong></pre><pre><strong><span style=3D'font-family:"Couri=
er New";background:yellow;mso-highlight:yellow'>--- a/net/sched/act_bpf.c<o=
:p></o:p></span></strong></pre><pre><strong><span style=3D'font-family:"Cou=
rier New";background:yellow;mso-highlight:yellow'>+++ b/net/sched/act_bpf.c=
<o:p></o:p></span></strong></pre><pre><strong><span style=3D'font-family:"C=
ourier New";background:yellow;mso-highlight:yellow'>@@ -121,7 +121,7 @@ sta=
tic int tcf_bpf_dump_ebpf_info(const struct tcf_bpf *prog,<o:p></o:p></span=
></strong></pre><pre><strong><span style=3D'font-family:"Courier New";backg=
round:yellow;mso-highlight:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
=C2=A0=C2=A0=C2=A0=C2=A0nla_put_string(skb, TCA_ACT_BPF_NAME, prog-&gt;bpf_=
name))<o:p></o:p></span></strong></pre><pre><strong><span style=3D'font-fam=
ily:"Courier New";background:yellow;mso-highlight:yellow'> =C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EMS=
GSIZE;<o:p></o:p></span></strong></pre><pre><strong><span style=3D'font-fam=
ily:"Courier New";background:yellow;mso-highlight:yellow'> <o:p></o:p></spa=
n></strong></pre><pre><strong><span style=3D'font-family:"Courier New";back=
ground:yellow;mso-highlight:yellow'>-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 i=
f (nla_put_u32(skb, TCA_ACT_BPF_ID, prog-&gt;filter-&gt;aux-&gt;id))<o:p></=
o:p></span></strong></pre><pre><strong><span style=3D'font-family:"Courier =
New";background:yellow;mso-highlight:yellow'>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 if (nla_put_u32(skb, TCA_ACT_BPF_ID, bpf_prog_get_id(prog-&gt;fil=
ter)))<o:p></o:p></span></strong></pre><pre><strong><span style=3D'font-fam=
ily:"Courier New";background:yellow;mso-highlight:yellow'> =C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EMS=
GSIZE;<o:p></o:p></span></strong></pre><pre><strong><span style=3D'font-fam=
ily:"Courier New";background:yellow;mso-highlight:yellow'> <o:p></o:p></spa=
n></strong></pre><pre><strong><span style=3D'font-family:"Courier New";back=
ground:yellow;mso-highlight:yellow'>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 nla =3D nla_reserve(skb, TCA_ACT_BPF_TAG, sizeof(prog-&gt;filter-&gt;ta=
g));<o:p></o:p></span></strong></pre><pre><strong><span style=3D'font-famil=
y:"Courier New";background:yellow;mso-highlight:yellow'>diff --git a/net/sc=
hed/cls_bpf.c b/net/sched/cls_bpf.c<o:p></o:p></span></strong></pre><pre><s=
trong><span style=3D'font-family:"Courier New";background:yellow;mso-highli=
ght:yellow'>index bc317b3eac12..eb5ac6be589e 100644<o:p></o:p></span></stro=
ng></pre><pre><strong><span style=3D'font-family:"Courier New";background:y=
ellow;mso-highlight:yellow'>--- a/net/sched/cls_bpf.c<o:p></o:p></span></st=
rong></pre><pre><strong><span style=3D'font-family:"Courier New";background=
:yellow;mso-highlight:yellow'>+++ b/net/sched/cls_bpf.c<o:p></o:p></span></=
strong></pre><pre><strong><span style=3D'font-family:"Courier New";backgrou=
nd:yellow;mso-highlight:yellow'>@@ -565,7 +565,7 @@ static int cls_bpf_dump=
_ebpf_info(const struct cls_bpf_prog *prog,<o:p></o:p></span></strong></pre=
><pre><strong><span style=3D'font-family:"Courier New";background:yellow;ms=
o-highlight:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0=C2=A0nla_put_string(skb, TCA_BPF_NAME, prog-&gt;bpf_name))<o:p></o:p></=
span></strong></pre><pre><strong><span style=3D'font-family:"Courier New";b=
ackground:yellow;mso-highlight:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EMSGSIZE;<o:p></o:p><=
/span></strong></pre><pre><strong><span style=3D'font-family:"Courier New";=
background:yellow;mso-highlight:yellow'> <o:p></o:p></span></strong></pre><=
pre><strong><span style=3D'font-family:"Courier New";background:yellow;mso-=
highlight:yellow'>-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (nla_put_u32(skb=
, TCA_BPF_ID, prog-&gt;filter-&gt;aux-&gt;id))<o:p></o:p></span></strong></=
pre><pre><strong><span style=3D'font-family:"Courier New";background:yellow=
;mso-highlight:yellow'>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (nla_put_u3=
2(skb, TCA_BPF_ID, bpf_prog_get_id(prog-&gt;filter)))<o:p></o:p></span></st=
rong></pre><pre><strong><span style=3D'font-family:"Courier New";background=
:yellow;mso-highlight:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EMSGSIZE;<o:p></o:p></span></s=
trong></pre><pre><strong><span style=3D'font-family:"Courier New";backgroun=
d:yellow;mso-highlight:yellow'> <o:p></o:p></span></strong></pre><pre><stro=
ng><span style=3D'font-family:"Courier New";background:yellow;mso-highlight=
:yellow'>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 nla =3D nla_reserve(skb=
, TCA_BPF_TAG, sizeof(prog-&gt;filter-&gt;tag));<o:p></o:p></span></strong>=
</pre><pre><strong><span style=3D'font-family:"Courier New";background:yell=
ow;mso-highlight:yellow'>-- <o:p></o:p></span></strong></pre><pre><strong><=
span style=3D'font-family:"Courier New";background:yellow;mso-highlight:yel=
low'>2.39.0<o:p></o:p></span></strong></pre><pre><strong><span style=3D'fon=
t-family:"Courier New";background:yellow;mso-highlight:yellow'><o:p>&nbsp;<=
/o:p></span></strong></pre><pre><strong><span style=3D'font-family:"Courier=
 New";background:yellow;mso-highlight:yellow'><o:p>&nbsp;</o:p></span></str=
ong></pre><pre><strong><span style=3D'font-family:"Courier New";background:=
yellow;mso-highlight:yellow'>From mboxrd@z Thu Jan=C2=A0 1 00:00:00 1970<o:=
p></o:p></span></strong></pre><pre><strong><span style=3D'font-family:"Cour=
ier New";background:yellow;mso-highlight:yellow'>Return-Path: &lt;linux-aud=
it-bounces@redhat.com&gt;<o:p></o:p></span></strong></pre><pre><strong><spa=
n style=3D'font-family:"Courier New";background:yellow;mso-highlight:yellow=
'>X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on<o:p></o:p></sp=
an></strong></pre><pre><strong><span style=3D'font-family:"Courier New";bac=
kground:yellow;mso-highlight:yellow'>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 aws-us-west-2-korg-lkml-1.web.codeaurora.org<o:p></o:p></span></stro=
ng></pre><pre><strong><span style=3D'font-family:"Courier New";background:y=
ellow;mso-highlight:yellow'>Received: from us-smtp-delivery-124.mimecast.co=
m (us-smtp-delivery-124.mimecast.com [170.10.133.124])<o:p></o:p></span></s=
trong></pre><pre><strong><span style=3D'font-family:"Courier New";backgroun=
d:yellow;mso-highlight:yellow'>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (=
using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))<o:p><=
/o:p></span></strong></pre><pre><strong><span style=3D'font-family:"Courier=
 New";background:yellow;mso-highlight:yellow'>=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 (No client certificate requested)<o:p></o:p></span></strong=
></pre><pre><strong><span style=3D'font-family:"Courier New";background:yel=
low;mso-highlight:yellow'>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 by smt=
p.lore.kernel.org (Postfix) with ESMTPS id 65980C4332F<o:p></o:p></span></s=
trong></pre><pre><strong><span style=3D'font-family:"Courier New";backgroun=
d:yellow;mso-highlight:yellow'>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 f=
or &lt;linux-audit@archiver.kernel.org&gt;; Fri, 23 Dec 2022 18:55:59 +0000=
 (UTC)<o:p></o:p></span></strong></pre><pre><strong><span style=3D'font-fam=
ily:"Courier New";background:yellow;mso-highlight:yellow'>DKIM-Signature: v=
=3D1; a=3Drsa-sha256; c=3Drelaxed/relaxed; d=3Dredhat.com;<o:p></o:p></span=
></strong></pre><pre><strong><span style=3D'font-family:"Courier New";backg=
round:yellow;mso-highlight:yellow'>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 s=3Dmimecast20190719; t=3D1671821758;<o:p></o:p></span></strong></pre><=
pre><strong><span style=3D'font-family:"Courier New";background:yellow;mso-=
highlight:yellow'>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 h=3Dfrom:from:=
sender:sender:reply-to:subject:subject:date:date:<o:p></o:p></span></strong=
></pre><pre><strong><span style=3D'font-family:"Courier New";background:yel=
low;mso-highlight:yellow'>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0  messa=
ge-id:message-id:to:to:cc:cc:mime-version:mime-version:<o:p></o:p></span></=
strong></pre><pre><strong><span style=3D'font-family:"Courier New";backgrou=
nd:yellow;mso-highlight:yellow'>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
 content-type:content-type:<o:p></o:p></span></strong></pre><pre><strong><s=
pan style=3D'font-family:"Courier New";background:yellow;mso-highlight:yell=
ow'>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0  content-transfer-encoding:c=
ontent-transfer-encoding:list-id:list-help:<o:p></o:p></span></strong></pre=
><pre><strong><span style=3D'font-family:"Courier New";background:yellow;ms=
o-highlight:yellow'>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0  list-unsubs=
cribe:list-subscribe:list-post;<o:p></o:p></span></strong></pre><pre><stron=
g><span style=3D'font-family:"Courier New";background:yellow;mso-highlight:=
yellow'>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bh=3DasiHuOkcbekxm31BZtp=
hD1tarMMM2R55B6VI8uEw3FA=3D;<o:p></o:p></span></strong></pre><pre><strong><=
span style=3D'font-family:"Courier New";background:yellow;mso-highlight:yel=
low'>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 b=3DWJPnwgvdFHmpzbzjaEuEThM=
elSKYZRDlo4cFHDulVhXJ/Ss58r3z18CC9PzUb6wX/Fb+7v<o:p></o:p></span></strong><=
/pre><pre><strong><span style=3D'font-family:"Courier New";background:yello=
w;mso-highlight:yellow'>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 y7yoYFAm=
bk/Md5nMNhpZlgyPnPnbODNEyW0PERlvGqpzvGVy2VFEGI3+T3dwrQvDytPA77<o:p></o:p></=
span></strong></pre><pre><strong><span style=3D'font-family:"Courier New";b=
ackground:yellow;mso-highlight:yellow'>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 20j9tmT1WkfK/jrUHaFEqIxAfT2Tefg=3D<o:p></o:p></span></strong></pre><=
pre><strong><span style=3D'font-family:"Courier New";background:yellow;mso-=
highlight:yellow'>Received: from mimecast-mx02.redhat.com (mimecast-mx02.re=
dhat.com<o:p></o:p></span></strong></pre><pre><strong><span style=3D'font-f=
amily:"Courier New";background:yellow;mso-highlight:yellow'> [66.187.233.88=
]) by relay.mimecast.com with ESMTP with STARTTLS<o:p></o:p></span></strong=
></pre><pre><strong><span style=3D'font-family:"Courier New";background:yel=
low;mso-highlight:yellow'> (version=3DTLSv1.2, cipher=3DTLS_ECDHE_RSA_WITH_=
AES_256_GCM_SHA384) id<o:p></o:p></span></strong></pre><pre><strong><span s=
tyle=3D'font-family:"Courier New";background:yellow;mso-highlight:yellow'> =
us-mta-50-6CpqV3ReND6cE_3Xaf36Yw-1; Fri, 23 Dec 2022 13:55:55 -0500<o:p></o=
:p></span></strong></pre><pre><strong><span style=3D'font-family:"Courier N=
ew";background:yellow;mso-highlight:yellow'>X-MC-Unique: 6CpqV3ReND6cE_3Xaf=
36Yw-1<o:p></o:p></span></strong></pre><pre><strong><span style=3D'font-fam=
ily:"Courier New";background:yellow;mso-highlight:yellow'>Received: from sm=
tp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])=
<o:p></o:p></span></strong></pre><pre><strong><span style=3D'font-family:"C=
ourier New";background:yellow;mso-highlight:yellow'>=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 =
bits))<o:p></o:p></span></strong></pre><pre><strong><span style=3D'font-fam=
ily:"Courier New";background:yellow;mso-highlight:yellow'>=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 (No client certificate requested)<o:p></o:p></s=
pan></strong></pre><pre><strong><span style=3D'font-family:"Courier New";ba=
ckground:yellow;mso-highlight:yellow'>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D96C918E0921;<o=
:p></o:p></span></strong></pre><pre><strong><span style=3D'font-family:"Cou=
rier New";background:yellow;mso-highlight:yellow'>=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 Fri, 23 Dec 2022 18:55:53 +0000 (UTC)<o:p></o:p></span><=
/strong></pre><pre><strong><span style=3D'font-family:"Courier New";backgro=
und:yellow;mso-highlight:yellow'>Received: from mm-prod-listman-01.mail-001=
.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])<o:p></o:p></span></=
strong></pre><pre><strong><span style=3D'font-family:"Courier New";backgrou=
nd:yellow;mso-highlight:yellow'>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
by smtp.corp.redhat.com (Postfix) with ESMTP id 52241111F3B0;<o:p></o:p></s=
pan></strong></pre><pre><strong><span style=3D'font-family:"Courier New";ba=
ckground:yellow;mso-highlight:yellow'>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 Fri, 23 Dec 2022 18:55:53 +0000 (UTC)<o:p></o:p></span></strong></pr=
e><pre><strong><span style=3D'font-family:"Courier New";background:yellow;m=
so-highlight:yellow'>Received: from mm-prod-listman-01.mail-001.prod.us-eas=
t-1.aws.redhat.com (localhost [IPv6:::1])<o:p></o:p></span></strong></pre><=
pre><strong><span style=3D'font-family:"Courier New";background:yellow;mso-=
highlight:yellow'>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 by mm-prod-lis=
tman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 13E2=
119465B3;<o:p></o:p></span></strong></pre><pre><strong><span style=3D'font-=
family:"Courier New";background:yellow;mso-highlight:yellow'>=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Fri, 23 Dec 2022 18:55:53 +0000 (UTC)<o:p></=
o:p></span></strong></pre><pre><strong><span style=3D'font-family:"Courier =
New";background:yellow;mso-highlight:yellow'>Received: from smtp.corp.redha=
t.com (int-mx08.intmail.prod.int.rdu2.redhat.com<o:p></o:p></span></strong>=
</pre><pre><strong><span style=3D'font-family:"Courier New";background:yell=
ow;mso-highlight:yellow'> [10.11.54.8])<o:p></o:p></span></strong></pre><pr=
e><strong><span style=3D'font-family:"Courier New";background:yellow;mso-hi=
ghlight:yellow'> by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.c=
om (Postfix) with<o:p></o:p></span></strong></pre><pre><strong><span style=
=3D'font-family:"Courier New";background:yellow;mso-highlight:yellow'> ESMT=
P id 8076C19465B1 for &lt;linux-audit@listman.corp.redhat.com&gt;;<o:p></o:=
p></span></strong></pre><pre><strong><span style=3D'font-family:"Courier Ne=
w";background:yellow;mso-highlight:yellow'> Fri, 23 Dec 2022 18:55:40 +0000=
 (UTC)<o:p></o:p></span></strong></pre><pre><strong><span style=3D'font-fam=
ily:"Courier New";background:yellow;mso-highlight:yellow'>Received: by smtp=
.corp.redhat.com (Postfix)<o:p></o:p></span></strong></pre><pre><strong><sp=
an style=3D'font-family:"Courier New";background:yellow;mso-highlight:yello=
w'> id 63792C15BAE; Fri, 23 Dec 2022 18:55:40 +0000 (UTC)<o:p></o:p></span>=
</strong></pre><pre><strong><span style=3D'font-family:"Courier New";backgr=
ound:yellow;mso-highlight:yellow'>Received: from mimecast-mx02.redhat.com<o=
:p></o:p></span></strong></pre><pre><strong><span style=3D'font-family:"Cou=
rier New";background:yellow;mso-highlight:yellow'> (mimecast09.extmail.prod=
.ext.rdu2.redhat.com [10.11.55.25])<o:p></o:p></span></strong></pre><pre><s=
trong><span style=3D'font-family:"Courier New";background:yellow;mso-highli=
ght:yellow'> by smtp.corp.redhat.com (Postfix) with ESMTPS id 5BD04C15BA0<o=
:p></o:p></span></strong></pre><pre><strong><span style=3D'font-family:"Cou=
rier New";background:yellow;mso-highlight:yellow'> for &lt;linux-audit@redh=
at.com&gt;; Fri, 23 Dec 2022 18:55:40 +0000 (UTC)<o:p></o:p></span></strong=
></pre><pre><strong><span style=3D'font-family:"Courier New";background:yel=
low;mso-highlight:yellow'>Received: from us-smtp-1.mimecast.com (us-smtp-de=
livery-1.mimecast.com<o:p></o:p></span></strong></pre><pre><strong><span st=
yle=3D'font-family:"Courier New";background:yellow;mso-highlight:yellow'> [=
207.211.31.120])<o:p></o:p></span></strong></pre><pre><strong><span style=
=3D'font-family:"Courier New";background:yellow;mso-highlight:yellow'> (usi=
ng TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))<o:p></o:=
p></span></strong></pre><pre><strong><span style=3D'font-family:"Courier Ne=
w";background:yellow;mso-highlight:yellow'> (No client certificate requeste=
d)<o:p></o:p></span></strong></pre><pre><strong><span style=3D'font-family:=
"Courier New";background:yellow;mso-highlight:yellow'> by mimecast-mx02.red=
hat.com (Postfix) with ESMTPS id 368682802E21<o:p></o:p></span></strong></p=
re><pre><strong><span style=3D'font-family:"Courier New";background:yellow;=
mso-highlight:yellow'> for &lt;linux-audit@redhat.com&gt;; Fri, 23 Dec 2022=
 18:55:40 +0000 (UTC)<o:p></o:p></span></strong></pre><pre><strong><span st=
yle=3D'font-family:"Courier New";background:yellow;mso-highlight:yellow'>Re=
ceived: from mail-qt1-f179.google.com (mail-qt1-f179.google.com<o:p></o:p><=
/span></strong></pre><pre><strong><span style=3D'font-family:"Courier New";=
background:yellow;mso-highlight:yellow'> [209.85.160.179]) by relay.mimecas=
t.com with ESMTP with STARTTLS<o:p></o:p></span></strong></pre><pre><strong=
><span style=3D'font-family:"Courier New";background:yellow;mso-highlight:y=
ellow'> (version=3DTLSv1.3, cipher=3DTLS_AES_128_GCM_SHA256) id<o:p></o:p><=
/span></strong></pre><pre><strong><span style=3D'font-family:"Courier New";=
background:yellow;mso-highlight:yellow'> us-mta-351-8jm3k5RPMXuhVSaa4HoaEQ-=
1; Fri, 23 Dec 2022 13:55:35 -0500<o:p></o:p></span></strong></pre><pre><st=
rong><span style=3D'font-family:"Courier New";background:yellow;mso-highlig=
ht:yellow'>X-MC-Unique: 8jm3k5RPMXuhVSaa4HoaEQ-1<o:p></o:p></span></strong>=
</pre><pre><strong><span style=3D'font-family:"Courier New";background:yell=
ow;mso-highlight:yellow'>Received: by mail-qt1-f179.google.com with SMTP id=
 jr11so4365783qtb.7<o:p></o:p></span></strong></pre><pre><strong><span styl=
e=3D'font-family:"Courier New";background:yellow;mso-highlight:yellow'> for=
 &lt;linux-audit@redhat.com&gt;; Fri, 23 Dec 2022 10:55:35 -0800 (PST)<o:p>=
</o:p></span></strong></pre><pre><strong><span style=3D'font-family:"Courie=
r New";background:yellow;mso-highlight:yellow'>X-Google-DKIM-Signature: v=
=3D1; a=3Drsa-sha256; c=3Drelaxed/relaxed;<o:p></o:p></span></strong></pre>=
<pre><strong><span style=3D'font-family:"Courier New";background:yellow;mso=
-highlight:yellow'> d=3D1e100.net; s=3D20210112;<o:p></o:p></span></strong>=
</pre><pre><strong><span style=3D'font-family:"Courier New";background:yell=
ow;mso-highlight:yellow'> h=3Dcontent-transfer-encoding:mime-version:messag=
e-id:date:subject:cc<o:p></o:p></span></strong></pre><pre><strong><span sty=
le=3D'font-family:"Courier New";background:yellow;mso-highlight:yellow'> :t=
o:from:x-gm-message-state:from:to:cc:subject:date:message-id<o:p></o:p></sp=
an></strong></pre><pre><strong><span style=3D'font-family:"Courier New";bac=
kground:yellow;mso-highlight:yellow'> :reply-to;<o:p></o:p></span></strong>=
</pre><pre><strong><span style=3D'font-family:"Courier New";background:yell=
ow;mso-highlight:yellow'> bh=3DlhhMHYaC67tFGFGcSbdKjULs2J3+Vd+1RKeEK+kH4Cc=
=3D;<o:p></o:p></span></strong></pre><pre><strong><span style=3D'font-famil=
y:"Courier New";background:yellow;mso-highlight:yellow'> b=3DitYWBwQzT2IG38=
JZODIH43Lt37xgbpxCciGTUE0pxiBb4R0BVfglKTRZUoSpsecCh5<o:p></o:p></span></str=
ong></pre><pre><strong><span style=3D'font-family:"Courier New";background:=
yellow;mso-highlight:yellow'> BITxTnRvEGVFanI98hkbV9P1gc5ytMQdTUc0w4pZdIJIL=
8ECFJWNoLXl8/k0yKG+tkfg<o:p></o:p></span></strong></pre><pre><strong><span =
style=3D'font-family:"Courier New";background:yellow;mso-highlight:yellow'>=
 TyytJZrvg9ppTB/d0m7LyRiN0V9LdJAsvJamLh3xC6MfRNc/seesBywpxwPaaP217dcv<o:p><=
/o:p></span></strong></pre><pre><strong><span style=3D'font-family:"Courier=
 New";background:yellow;mso-highlight:yellow'> N/Kf93pUOd9X7uaVSnQUOeaVT+tI=
8a7a/TaMWD7GBwu9gkp5CjeiyTq2mjmrp3NZoJMt<o:p></o:p></span></strong></pre><p=
re><strong><span style=3D'font-family:"Courier New";background:yellow;mso-h=
ighlight:yellow'> FeZY3WgAw/ZkwjgCu8kzC3o8tEUpyrni2GtHiSAiAk9xMFIWfhycXUWA/=
613WiWbOQu9<o:p></o:p></span></strong></pre><pre><strong><span style=3D'fon=
t-family:"Courier New";background:yellow;mso-highlight:yellow'> lhOw=3D=3D<=
o:p></o:p></span></strong></pre><pre><strong><span style=3D'font-family:"Co=
urier New";background:yellow;mso-highlight:yellow'>X-Gm-Message-State: AFqh=
2kpgCCpDOTXUW01dFIt25uq1J/2MGMGf5BeauNNa7CUW6zwhE6al<o:p></o:p></span></str=
ong></pre><pre><strong><span style=3D'font-family:"Courier New";background:=
yellow;mso-highlight:yellow'> PQsL6Lt+6WCia6nkn+LvZiKXTt//CncOFBk=3D<o:p></=
o:p></span></strong></pre><pre><strong><span style=3D'font-family:"Courier =
New";background:yellow;mso-highlight:yellow'>X-Google-Smtp-Source: AMrXdXu8=
cul6nGNvqFpetdDXyEX3mJ61V9n58IzDc+hHnff1D4ZmgroXFQTgbc8qqkB+rVWcDXxesw=3D=
=3D<o:p></o:p></span></strong></pre><pre><strong><span style=3D'font-family=
:"Courier New";background:yellow;mso-highlight:yellow'>X-Received: by 2002:=
ac8:7354:0:b0:3a6:a699:3cd8 with SMTP id<o:p></o:p></span></strong></pre><p=
re><strong><span style=3D'font-family:"Courier New";background:yellow;mso-h=
ighlight:yellow'> q20-20020ac87354000000b003a6a6993cd8mr12926355qtp.57.1671=
821734468; <o:p></o:p></span></strong></pre><pre><strong><span style=3D'fon=
t-family:"Courier New";background:yellow;mso-highlight:yellow'>=C2=A0Fri, 2=
3 Dec 2022 10:55:34 -0800 (PST)<o:p></o:p></span></strong></pre><pre><stron=
g><span style=3D'font-family:"Courier New";background:yellow;mso-highlight:=
yellow'>Received: from localhost (pool-108-26-161-203.bstnma.fios.verizon.n=
et.<o:p></o:p></span></strong></pre><pre><strong><span style=3D'font-family=
:"Courier New";background:yellow;mso-highlight:yellow'> [108.26.161.203]) b=
y smtp.gmail.com with ESMTPSA id<o:p></o:p></span></strong></pre><pre><stro=
ng><span style=3D'font-family:"Courier New";background:yellow;mso-highlight=
:yellow'> bm36-20020a05620a19a400b006fa4cac54a5sm2696550qkb.72.2022.12.23.1=
0.55.31<o:p></o:p></span></strong></pre><pre><strong><span style=3D'font-fa=
mily:"Courier New";background:yellow;mso-highlight:yellow'> (version=3DTLS1=
_3 cipher=3DTLS_AES_256_GCM_SHA384 bits=3D256/256);<o:p></o:p></span></stro=
ng></pre><pre><strong><span style=3D'font-family:"Courier New";background:y=
ellow;mso-highlight:yellow'> Fri, 23 Dec 2022 10:55:32 -0800 (PST)<o:p></o:=
p></span></strong></pre><pre><strong><span style=3D'font-family:"Courier Ne=
w";background:yellow;mso-highlight:yellow'>From: Paul Moore &lt;paul@paul-m=
oore.com&gt;<o:p></o:p></span></strong></pre><pre><strong><span style=3D'fo=
nt-family:"Courier New";background:yellow;mso-highlight:yellow'>To: linux-a=
udit@redhat.com,<o:p></o:p></span></strong></pre><pre><strong><span style=
=3D'font-family:"Courier New";background:yellow;mso-highlight:yellow'>=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bpf@vger.kernel.org<o:p></o:p></spa=
n></strong></pre><pre><strong><span style=3D'font-family:"Courier New";back=
ground:yellow;mso-highlight:yellow'>Subject: [PATCH v2] bpf: restore the eb=
pf program ID for BPF_AUDIT_UNLOAD and<o:p></o:p></span></strong></pre><pre=
><strong><span style=3D'font-family:"Courier New";background:yellow;mso-hig=
hlight:yellow'> PERF_BPF_EVENT_PROG_UNLOAD<o:p></o:p></span></strong></pre>=
<pre><strong><span style=3D'font-family:"Courier New";background:yellow;mso=
-highlight:yellow'>Date: Fri, 23 Dec 2022 13:55:31 -0500<o:p></o:p></span><=
/strong></pre><pre><strong><span style=3D'font-family:"Courier New";backgro=
und:yellow;mso-highlight:yellow'>Message-Id: &lt;20221223185531.222689-1-pa=
ul@paul-moore.com&gt;<o:p></o:p></span></strong></pre><pre><strong><span st=
yle=3D'font-family:"Courier New";background:yellow;mso-highlight:yellow'>MI=
ME-Version: 1.0<o:p></o:p></span></strong></pre><pre><strong><span style=3D=
'font-family:"Courier New";background:yellow;mso-highlight:yellow'>X-Mimeca=
st-Impersonation-Protect: Policy=3DCLT - Impersonation Protection<o:p></o:p=
></span></strong></pre><pre><strong><span style=3D'font-family:"Courier New=
";background:yellow;mso-highlight:yellow'> Definition; Similar Internal Dom=
ain=3Dfalse;<o:p></o:p></span></strong></pre><pre><strong><span style=3D'fo=
nt-family:"Courier New";background:yellow;mso-highlight:yellow'> Similar Mo=
nitored External Domain=3Dfalse; Custom External Domain=3Dfalse;<o:p></o:p>=
</span></strong></pre><pre><strong><span style=3D'font-family:"Courier New"=
;background:yellow;mso-highlight:yellow'> Mimecast External Domain=3Dfalse;=
 Newly Observed Domain=3Dfalse;<o:p></o:p></span></strong></pre><pre><stron=
g><span style=3D'font-family:"Courier New";background:yellow;mso-highlight:=
yellow'> Internal User Name=3Dfalse; Custom Display Name List=3Dfalse;<o:p>=
</o:p></span></strong></pre><pre><strong><span style=3D'font-family:"Courie=
r New";background:yellow;mso-highlight:yellow'> Reply-to Address Mismatch=
=3Dfalse; Targeted Threat Dictionary=3Dfalse;<o:p></o:p></span></strong></p=
re><pre><strong><span style=3D'font-family:"Courier New";background:yellow;=
mso-highlight:yellow'> Mimecast Threat Dictionary=3Dfalse; Custom Threat Di=
ctionary=3Dfalse<o:p></o:p></span></strong></pre><pre><strong><span style=
=3D'font-family:"Courier New";background:yellow;mso-highlight:yellow'>X-Sca=
nned-By: MIMEDefang 3.1 on 10.11.54.8<o:p></o:p></span></strong></pre><pre>=
<strong><span style=3D'font-family:"Courier New";background:yellow;mso-high=
light:yellow'>X-BeenThere: linux-audit@redhat.com<o:p></o:p></span></strong=
></pre><pre><strong><span style=3D'font-family:"Courier New";background:yel=
low;mso-highlight:yellow'>X-Mailman-Version: 2.1.29<o:p></o:p></span></stro=
ng></pre><pre><strong><span style=3D'font-family:"Courier New";background:y=
ellow;mso-highlight:yellow'>Precedence: list<o:p></o:p></span></strong></pr=
e><pre><strong><span style=3D'font-family:"Courier New";background:yellow;m=
so-highlight:yellow'>List-Id: Linux Audit Discussion &lt;linux-audit.redhat=
.com&gt;<o:p></o:p></span></strong></pre><pre><strong><span style=3D'font-f=
amily:"Courier New";background:yellow;mso-highlight:yellow'>List-Unsubscrib=
e: &lt;https://listman.redhat.com/mailman/options/linux-audit&gt;,<o:p></o:=
p></span></strong></pre><pre><strong><span style=3D'font-family:"Courier Ne=
w";background:yellow;mso-highlight:yellow'> &lt;mailto:linux-audit-request@=
redhat.com?subject=3Dunsubscribe&gt;<o:p></o:p></span></strong></pre><pre><=
strong><span style=3D'font-family:"Courier New";background:yellow;mso-highl=
ight:yellow'>List-Archive: &lt;http://listman.redhat.com/archives/linux-aud=
it/&gt;<o:p></o:p></span></strong></pre><pre><strong><span style=3D'font-fa=
mily:"Courier New";background:yellow;mso-highlight:yellow'>List-Post: &lt;m=
ailto:linux-audit@redhat.com&gt;<o:p></o:p></span></strong></pre><pre><stro=
ng><span style=3D'font-family:"Courier New";background:yellow;mso-highlight=
:yellow'>List-Help: &lt;mailto:linux-audit-request@redhat.com?subject=3Dhel=
p&gt;<o:p></o:p></span></strong></pre><pre><strong><span style=3D'font-fami=
ly:"Courier New";background:yellow;mso-highlight:yellow'>List-Subscribe: &l=
t;https://listman.redhat.com/mailman/listinfo/linux-audit&gt;,<o:p></o:p></=
span></strong></pre><pre><strong><span style=3D'font-family:"Courier New";b=
ackground:yellow;mso-highlight:yellow'> &lt;mailto:linux-audit-request@redh=
at.com?subject=3Dsubscribe&gt;<o:p></o:p></span></strong></pre><pre><strong=
><span style=3D'font-family:"Courier New";background:yellow;mso-highlight:y=
ellow'>Cc: Burn Alting &lt;burn.alting@iinet.net.au&gt;, Alexei Starovoitov=
 &lt;ast@kernel.org&gt;,<o:p></o:p></span></strong></pre><pre><strong><span=
 style=3D'font-family:"Courier New";background:yellow;mso-highlight:yellow'=
> Stanislav Fomichev &lt;sdf@google.com&gt;<o:p></o:p></span></strong></pre=
><pre><strong><span style=3D'font-family:"Courier New";background:yellow;ms=
o-highlight:yellow'>Errors-To: linux-audit-bounces@redhat.com<o:p></o:p></s=
pan></strong></pre><pre><strong><span style=3D'font-family:"Courier New";ba=
ckground:yellow;mso-highlight:yellow'>Sender: &quot;Linux-audit&quot; &lt;l=
inux-audit-bounces@redhat.com&gt;<o:p></o:p></span></strong></pre><pre><str=
ong><span style=3D'font-family:"Courier New";background:yellow;mso-highligh=
t:yellow'>X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3<o:p></o:p></span></str=
ong></pre><pre><strong><span style=3D'font-family:"Courier New";background:=
yellow;mso-highlight:yellow'>X-Mimecast-Spam-Score: 0<o:p></o:p></span></st=
rong></pre><pre><strong><span style=3D'font-family:"Courier New";background=
:yellow;mso-highlight:yellow'>X-Mimecast-Originator: redhat.com<o:p></o:p><=
/span></strong></pre><pre><strong><span style=3D'font-family:"Courier New";=
background:yellow;mso-highlight:yellow'>Content-Type: text/plain; charset=
=3D&quot;us-ascii&quot;<o:p></o:p></span></strong></pre><pre><strong><span =
style=3D'font-family:"Courier New";background:yellow;mso-highlight:yellow'>=
Content-Transfer-Encoding: 7bit<o:p></o:p></span></strong></pre><pre><stron=
g><span style=3D'font-family:"Courier New";background:yellow;mso-highlight:=
yellow'><o:p>&nbsp;</o:p></span></strong></pre><pre><strong><span style=3D'=
font-family:"Courier New";background:yellow;mso-highlight:yellow'>When chan=
ging the ebpf program put() routines to support being called<o:p></o:p></sp=
an></strong></pre><pre><strong><span style=3D'font-family:"Courier New";bac=
kground:yellow;mso-highlight:yellow'>from within IRQ context the program ID=
 was reset to zero prior to<o:p></o:p></span></strong></pre><pre><strong><s=
pan style=3D'font-family:"Courier New";background:yellow;mso-highlight:yell=
ow'>calling the perf event and audit UNLOAD record generators, which<o:p></=
o:p></span></strong></pre><pre><strong><span style=3D'font-family:"Courier =
New";background:yellow;mso-highlight:yellow'>resulted in problems as the eb=
pf program ID was bogus (always zero).<o:p></o:p></span></strong></pre><pre=
><strong><span style=3D'font-family:"Courier New";background:yellow;mso-hig=
hlight:yellow'>This patch resolves this by adding a new flag, bpf_prog::val=
id_id, to<o:p></o:p></span></strong></pre><pre><strong><span style=3D'font-=
family:"Courier New";background:yellow;mso-highlight:yellow'>indicate when =
the bpf_prog_aux ID field is valid; it is set to true/1<o:p></o:p></span></=
strong></pre><pre><strong><span style=3D'font-family:"Courier New";backgrou=
nd:yellow;mso-highlight:yellow'>in bpf_prog_alloc_id() and set to false/0 i=
n bpf_prog_free_id().=C2=A0 In<o:p></o:p></span></strong></pre><pre><strong=
><span style=3D'font-family:"Courier New";background:yellow;mso-highlight:y=
ellow'>order to help ensure that access to the bpf_prog_aux ID field takes<=
o:p></o:p></span></strong></pre><pre><strong><span style=3D'font-family:"Co=
urier New";background:yellow;mso-highlight:yellow'>into account the new val=
id_id flag, the bpf_prog_aux ID field is<o:p></o:p></span></strong></pre><p=
re><strong><span style=3D'font-family:"Courier New";background:yellow;mso-h=
ighlight:yellow'>renamed to bpf_prog_aux::__id and a getter function,<o:p><=
/o:p></span></strong></pre><pre><strong><span style=3D'font-family:"Courier=
 New";background:yellow;mso-highlight:yellow'>bpf_prog_get_id(), was create=
d and all users of bpf_prog_aux::id were<o:p></o:p></span></strong></pre><p=
re><strong><span style=3D'font-family:"Courier New";background:yellow;mso-h=
ighlight:yellow'>converted to the new caller.=C2=A0 Exceptions to this incl=
ude some of the<o:p></o:p></span></strong></pre><pre><strong><span style=3D=
'font-family:"Courier New";background:yellow;mso-highlight:yellow'>internal=
 ebpf functions and the xdp trace points, although the latter<o:p></o:p></s=
pan></strong></pre><pre><strong><span style=3D'font-family:"Courier New";ba=
ckground:yellow;mso-highlight:yellow'>still take into account the valid_id =
flag.<o:p></o:p></span></strong></pre><pre><strong><span style=3D'font-fami=
ly:"Courier New";background:yellow;mso-highlight:yellow'><o:p>&nbsp;</o:p><=
/span></strong></pre><pre><strong><span style=3D'font-family:"Courier New";=
background:yellow;mso-highlight:yellow'>I also modified the bpf_audit_prog(=
) logic used to associate the<o:p></o:p></span></strong></pre><pre><strong>=
<span style=3D'font-family:"Courier New";background:yellow;mso-highlight:ye=
llow'>AUDIT_BPF record with other associated records, e.g. @ctx !=3D NULL.<=
o:p></o:p></span></strong></pre><pre><strong><span style=3D'font-family:"Co=
urier New";background:yellow;mso-highlight:yellow'>Instead of keying off th=
e operation, it now keys off the execution<o:p></o:p></span></strong></pre>=
<pre><strong><span style=3D'font-family:"Courier New";background:yellow;mso=
-highlight:yellow'>context, e.g. '!in_irg &amp;&amp; !irqs_disabled()', whi=
ch is much more<o:p></o:p></span></strong></pre><pre><strong><span style=3D=
'font-family:"Courier New";background:yellow;mso-highlight:yellow'>appropri=
ate and should help better connect the UNLOAD operations with<o:p></o:p></s=
pan></strong></pre><pre><strong><span style=3D'font-family:"Courier New";ba=
ckground:yellow;mso-highlight:yellow'>the associated audit state (other aud=
it records).<o:p></o:p></span></strong></pre><pre><strong><span style=3D'fo=
nt-family:"Courier New";background:yellow;mso-highlight:yellow'><o:p>&nbsp;=
</o:p></span></strong></pre><pre><strong><span style=3D'font-family:"Courie=
r New";background:yellow;mso-highlight:yellow'>Fixes: d809e134be7a (&quot;b=
pf: Prepare bpf_prog_put() to be called from irq context.&quot;)<o:p></o:p>=
</span></strong></pre><pre><strong><span style=3D'font-family:"Courier New"=
;background:yellow;mso-highlight:yellow'>Reported-by: Burn Alting &lt;burn.=
alting@iinet.net.au&gt;<o:p></o:p></span></strong></pre><pre><strong><span =
style=3D'font-family:"Courier New";background:yellow;mso-highlight:yellow'>=
Reported-by: Jiri Olsa &lt;olsajiri@gmail.com&gt;<o:p></o:p></span></strong=
></pre><pre><strong><span style=3D'font-family:"Courier New";background:yel=
low;mso-highlight:yellow'>Signed-off-by: Paul Moore &lt;paul@paul-moore.com=
&gt;<o:p></o:p></span></strong></pre><pre><strong><span style=3D'font-famil=
y:"Courier New";background:yellow;mso-highlight:yellow'><o:p>&nbsp;</o:p></=
span></strong></pre><pre><strong><span style=3D'font-family:"Courier New";b=
ackground:yellow;mso-highlight:yellow'>--<o:p></o:p></span></strong></pre><=
pre><strong><span style=3D'font-family:"Courier New";background:yellow;mso-=
highlight:yellow'>* v2<o:p></o:p></span></strong></pre><pre><strong><span s=
tyle=3D'font-family:"Courier New";background:yellow;mso-highlight:yellow'>=
=C2=A0 - change subj<o:p></o:p></span></strong></pre><pre><strong><span sty=
le=3D'font-family:"Courier New";background:yellow;mso-highlight:yellow'>=C2=
=A0 - add mention of the perf regression<o:p></o:p></span></strong></pre><p=
re><strong><span style=3D'font-family:"Courier New";background:yellow;mso-h=
ighlight:yellow'>=C2=A0 - drop the dedicated program audit ID<o:p></o:p></s=
pan></strong></pre><pre><strong><span style=3D'font-family:"Courier New";ba=
ckground:yellow;mso-highlight:yellow'>=C2=A0 - add the bpf_prog::valid_id f=
lag, bpf_prog_get_id() getter<o:p></o:p></span></strong></pre><pre><strong>=
<span style=3D'font-family:"Courier New";background:yellow;mso-highlight:ye=
llow'>=C2=A0 - convert prog ID users to new ID getter<o:p></o:p></span></st=
rong></pre><pre><strong><span style=3D'font-family:"Courier New";background=
:yellow;mso-highlight:yellow'>* v1<o:p></o:p></span></strong></pre><pre><st=
rong><span style=3D'font-family:"Courier New";background:yellow;mso-highlig=
ht:yellow'>=C2=A0 - subj was: &quot;bpf: restore the ebpf audit UNLOAD id f=
ield&quot;<o:p></o:p></span></strong></pre><pre><strong><span style=3D'font=
-family:"Courier New";background:yellow;mso-highlight:yellow'>=C2=A0 - init=
ial draft<o:p></o:p></span></strong></pre><pre><strong><span style=3D'font-=
family:"Courier New";background:yellow;mso-highlight:yellow'>---<o:p></o:p>=
</span></strong></pre><pre><strong><span style=3D'font-family:"Courier New"=
;background:yellow;mso-highlight:yellow'> drivers/net/netdevsim/bpf.c=C2=A0=
 |=C2=A0 6 ++++--<o:p></o:p></span></strong></pre><pre><strong><span style=
=3D'font-family:"Courier New";background:yellow;mso-highlight:yellow'> incl=
ude/linux/bpf.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 11 =
+++++++++--<o:p></o:p></span></strong></pre><pre><strong><span style=3D'fon=
t-family:"Courier New";background:yellow;mso-highlight:yellow'> include/lin=
ux/bpf_verifier.h |=C2=A0 2 +-<o:p></o:p></span></strong></pre><pre><strong=
><span style=3D'font-family:"Courier New";background:yellow;mso-highlight:y=
ellow'> include/trace/events/xdp.h=C2=A0=C2=A0 |=C2=A0 4 ++--<o:p></o:p></s=
pan></strong></pre><pre><strong><span style=3D'font-family:"Courier New";ba=
ckground:yellow;mso-highlight:yellow'> kernel/bpf/arraymap.c=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-<o:p></o:p></span></strong></pre><p=
re><strong><span style=3D'font-family:"Courier New";background:yellow;mso-h=
ighlight:yellow'> kernel/bpf/bpf_struct_ops.c=C2=A0 |=C2=A0 2 +-<o:p></o:p>=
</span></strong></pre><pre><strong><span style=3D'font-family:"Courier New"=
;background:yellow;mso-highlight:yellow'> kernel/bpf/cgroup.c=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-<o:p></o:p></span></=
strong></pre><pre><strong><span style=3D'font-family:"Courier New";backgrou=
nd:yellow;mso-highlight:yellow'> kernel/bpf/core.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-<o:p></o:p></span></=
strong></pre><pre><strong><span style=3D'font-family:"Courier New";backgrou=
nd:yellow;mso-highlight:yellow'> kernel/bpf/cpumap.c=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-<o:p></o:p></span></strong></=
pre><pre><strong><span style=3D'font-family:"Courier New";background:yellow=
;mso-highlight:yellow'> kernel/bpf/devmap.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-<o:p></o:p></span></strong></pre><pre>=
<strong><span style=3D'font-family:"Courier New";background:yellow;mso-high=
light:yellow'> kernel/bpf/syscall.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 27 +++++++++++++++------------<o:p></o:p></span></strong></pre>=
<pre><strong><span style=3D'font-family:"Courier New";background:yellow;mso=
-highlight:yellow'> kernel/events/core.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 6 +++++-<o:p></o:p></span></strong></pre><pre><stro=
ng><span style=3D'font-family:"Courier New";background:yellow;mso-highlight=
:yellow'> kernel/trace/bpf_trace.c=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-<o:p=
></o:p></span></strong></pre><pre><strong><span style=3D'font-family:"Couri=
er New";background:yellow;mso-highlight:yellow'> net/core/dev.c=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 2 +-<o:p></o:p></span></strong></pre><pre><strong><span style=3D'fon=
t-family:"Courier New";background:yellow;mso-highlight:yellow'> net/core/fi=
lter.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 3 ++-<o:p></o:p></span></strong></pre><pre><strong><span style=3D'fo=
nt-family:"Courier New";background:yellow;mso-highlight:yellow'> net/core/r=
tnetlink.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-<o:p=
></o:p></span></strong></pre><pre><strong><span style=3D'font-family:"Couri=
er New";background:yellow;mso-highlight:yellow'> net/core/sock_map.c=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-<o:p></o:p></s=
pan></strong></pre><pre><strong><span style=3D'font-family:"Courier New";ba=
ckground:yellow;mso-highlight:yellow'> net/ipv6/seg6_local.c=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 3 ++-<o:p></o:p></span></strong></pre><=
pre><strong><span style=3D'font-family:"Courier New";background:yellow;mso-=
highlight:yellow'> net/sched/act_bpf.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-<o:p></o:p></span></strong></pre><pre><stron=
g><span style=3D'font-family:"Courier New";background:yellow;mso-highlight:=
yellow'> net/sched/cls_bpf.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 2 +-<o:p></o:p></span></strong></pre><pre><strong><span s=
tyle=3D'font-family:"Courier New";background:yellow;mso-highlight:yellow'> =
20 files changed, 52 insertions(+), 34 deletions(-)<o:p></o:p></span></stro=
ng></pre><pre><strong><span style=3D'font-family:"Courier New";background:y=
ellow;mso-highlight:yellow'><o:p>&nbsp;</o:p></span></strong></pre><pre><st=
rong><span style=3D'font-family:"Courier New";background:yellow;mso-highlig=
ht:yellow'>diff --git a/drivers/net/netdevsim/bpf.c b/drivers/net/netdevsim=
/bpf.c<o:p></o:p></span></strong></pre><pre><strong><span style=3D'font-fam=
ily:"Courier New";background:yellow;mso-highlight:yellow'>index 50854265864=
d..2795f03f5f34 100644<o:p></o:p></span></strong></pre><pre><strong><span s=
tyle=3D'font-family:"Courier New";background:yellow;mso-highlight:yellow'>-=
-- a/drivers/net/netdevsim/bpf.c<o:p></o:p></span></strong></pre><pre><stro=
ng><span style=3D'font-family:"Courier New";background:yellow;mso-highlight=
:yellow'>+++ b/drivers/net/netdevsim/bpf.c<o:p></o:p></span></strong></pre>=
<pre><strong><span style=3D'font-family:"Courier New";background:yellow;mso=
-highlight:yellow'>@@ -109,7 +109,7 @@ nsim_bpf_offload(struct netdevsim *n=
s, struct bpf_prog *prog, bool oldprog)<o:p></o:p></span></strong></pre><pr=
e><strong><span style=3D'font-family:"Courier New";background:yellow;mso-hi=
ghlight:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0&quot;bad offload state, expected offload %sto be active&quot;,<o:=
p></o:p></span></strong></pre><pre><strong><span style=3D'font-family:"Cour=
ier New";background:yellow;mso-highlight:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0oldprog ? &quot;&quot; : &quot;n=
ot &quot;);<o:p></o:p></span></strong></pre><pre><strong><span style=3D'fon=
t-family:"Courier New";background:yellow;mso-highlight:yellow'> =C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 ns-&gt;bpf_offloaded =3D prog;<o:p></o:p></span=
></strong></pre><pre><strong><span style=3D'font-family:"Courier New";backg=
round:yellow;mso-highlight:yellow'>-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ns=
-&gt;bpf_offloaded_id =3D prog ? prog-&gt;aux-&gt;id : 0;<o:p></o:p></span>=
</strong></pre><pre><strong><span style=3D'font-family:"Courier New";backgr=
ound:yellow;mso-highlight:yellow'>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ns-=
&gt;bpf_offloaded_id =3D prog ? bpf_prog_get_id(prog) : 0;<o:p></o:p></span=
></strong></pre><pre><strong><span style=3D'font-family:"Courier New";backg=
round:yellow;mso-highlight:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ns=
im_prog_set_loaded(prog, true);<o:p></o:p></span></strong></pre><pre><stron=
g><span style=3D'font-family:"Courier New";background:yellow;mso-highlight:=
yellow'> <o:p></o:p></span></strong></pre><pre><strong><span style=3D'font-=
family:"Courier New";background:yellow;mso-highlight:yellow'>=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;<o:p></o:p></span></strong></pre><p=
re><strong><span style=3D'font-family:"Courier New";background:yellow;mso-h=
ighlight:yellow'>@@ -221,6 +221,7 @@ static int nsim_bpf_create_prog(struct=
 nsim_dev *nsim_dev,<o:p></o:p></span></strong></pre><pre><strong><span sty=
le=3D'font-family:"Courier New";background:yellow;mso-highlight:yellow'> =
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct nsim_bpf_bound_prog *state;<o:p=
></o:p></span></strong></pre><pre><strong><span style=3D'font-family:"Couri=
er New";background:yellow;mso-highlight:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 char name[16];<o:p></o:p></span></strong></pre><pre><strong><s=
pan style=3D'font-family:"Courier New";background:yellow;mso-highlight:yell=
ow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int ret;<o:p></o:p></span></stron=
g></pre><pre><strong><span style=3D'font-family:"Courier New";background:ye=
llow;mso-highlight:yellow'>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u32 id;<o:=
p></o:p></span></strong></pre><pre><strong><span style=3D'font-family:"Cour=
ier New";background:yellow;mso-highlight:yellow'> <o:p></o:p></span></stron=
g></pre><pre><strong><span style=3D'font-family:"Courier New";background:ye=
llow;mso-highlight:yellow'>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 state=
 =3D kzalloc(sizeof(*state), GFP_KERNEL);<o:p></o:p></span></strong></pre><=
pre><strong><span style=3D'font-family:"Courier New";background:yellow;mso-=
highlight:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!state)<o:p></o=
:p></span></strong></pre><pre><strong><span style=3D'font-family:"Courier N=
ew";background:yellow;mso-highlight:yellow'>@@ -239,7 +240,8 @@ static int =
nsim_bpf_create_prog(struct nsim_dev *nsim_dev,<o:p></o:p></span></strong><=
/pre><pre><strong><span style=3D'font-family:"Courier New";background:yello=
w;mso-highlight:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;<o:p></o:p></span></strong></pre>=
<pre><strong><span style=3D'font-family:"Courier New";background:yellow;mso=
-highlight:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }<o:p></o:p></span=
></strong></pre><pre><strong><span style=3D'font-family:"Courier New";backg=
round:yellow;mso-highlight:yellow'> <o:p></o:p></span></strong></pre><pre><=
strong><span style=3D'font-family:"Courier New";background:yellow;mso-highl=
ight:yellow'>-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 debugfs_create_u32(&quot=
;id&quot;, 0400, state-&gt;ddir, &amp;prog-&gt;aux-&gt;id);<o:p></o:p></spa=
n></strong></pre><pre><strong><span style=3D'font-family:"Courier New";back=
ground:yellow;mso-highlight:yellow'>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 i=
d =3D bpf_prog_get_id(prog);<o:p></o:p></span></strong></pre><pre><strong><=
span style=3D'font-family:"Courier New";background:yellow;mso-highlight:yel=
low'>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 debugfs_create_u32(&quot;id&quot=
;, 0400, state-&gt;ddir, &amp;id);<o:p></o:p></span></strong></pre><pre><st=
rong><span style=3D'font-family:"Courier New";background:yellow;mso-highlig=
ht:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 debugfs_create_file(&quot;=
state&quot;, 0400, state-&gt;ddir,<o:p></o:p></span></strong></pre><pre><st=
rong><span style=3D'font-family:"Courier New";background:yellow;mso-highlig=
ht:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=
=A0=C2=A0=C2=A0&amp;state-&gt;state, &amp;nsim_bpf_string_fops);<o:p></o:p>=
</span></strong></pre><pre><strong><span style=3D'font-family:"Courier New"=
;background:yellow;mso-highlight:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 debugfs_create_bool(&quot;loaded&quot;, 0400, state-&gt;ddir, &amp;stat=
e-&gt;is_loaded);<o:p></o:p></span></strong></pre><pre><strong><span style=
=3D'font-family:"Courier New";background:yellow;mso-highlight:yellow'>diff =
--git a/include/linux/bpf.h b/include/linux/bpf.h<o:p></o:p></span></strong=
></pre><pre><strong><span style=3D'font-family:"Courier New";background:yel=
low;mso-highlight:yellow'>index 9e7d46d16032..18e965bd7db9 100644<o:p></o:p=
></span></strong></pre><pre><strong><span style=3D'font-family:"Courier New=
";background:yellow;mso-highlight:yellow'>--- a/include/linux/bpf.h<o:p></o=
:p></span></strong></pre><pre><strong><span style=3D'font-family:"Courier N=
ew";background:yellow;mso-highlight:yellow'>+++ b/include/linux/bpf.h<o:p><=
/o:p></span></strong></pre><pre><strong><span style=3D'font-family:"Courier=
 New";background:yellow;mso-highlight:yellow'>@@ -1102,7 +1102,7 @@ struct =
bpf_prog_aux {<o:p></o:p></span></strong></pre><pre><strong><span style=3D'=
font-family:"Courier New";background:yellow;mso-highlight:yellow'> =C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u32 max_pkt_offset;<o:p></o:p></span></stron=
g></pre><pre><strong><span style=3D'font-family:"Courier New";background:ye=
llow;mso-highlight:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u32 max_tp=
_access;<o:p></o:p></span></strong></pre><pre><strong><span style=3D'font-f=
amily:"Courier New";background:yellow;mso-highlight:yellow'> =C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 u32 stack_depth;<o:p></o:p></span></strong></pre><=
pre><strong><span style=3D'font-family:"Courier New";background:yellow;mso-=
highlight:yellow'>-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u32 id;<o:p></o:p><=
/span></strong></pre><pre><strong><span style=3D'font-family:"Courier New";=
background:yellow;mso-highlight:yellow'>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 u32 __id; /* access via bpf_prog_get_id() to check bpf_prog::valid_id *=
/<o:p></o:p></span></strong></pre><pre><strong><span style=3D'font-family:"=
Courier New";background:yellow;mso-highlight:yellow'> =C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 u32 func_cnt; /* used by non-func prog as the number of fun=
c progs */<o:p></o:p></span></strong></pre><pre><strong><span style=3D'font=
-family:"Courier New";background:yellow;mso-highlight:yellow'> =C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 u32 func_idx; /* 0 for non-func prog, the index in=
 func array for func prog */<o:p></o:p></span></strong></pre><pre><strong><=
span style=3D'font-family:"Courier New";background:yellow;mso-highlight:yel=
low'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u32 attach_btf_id; /* in-kernel =
BTF type id to attach to */<o:p></o:p></span></strong></pre><pre><strong><s=
pan style=3D'font-family:"Courier New";background:yellow;mso-highlight:yell=
ow'>@@ -1197,7 +1197,8 @@ struct bpf_prog {<o:p></o:p></span></strong></pre=
><pre><strong><span style=3D'font-family:"Courier New";background:yellow;ms=
o-highlight:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enforce_expected_attach_type:=
1, /* Enforce expected_attach_type checking at attach time */<o:p></o:p></s=
pan></strong></pre><pre><strong><span style=3D'font-family:"Courier New";ba=
ckground:yellow;mso-highlight:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 call_get_st=
ack:1, /* Do we call bpf_get_stack() or bpf_get_stackid() */<o:p></o:p></sp=
an></strong></pre><pre><strong><span style=3D'font-family:"Courier New";bac=
kground:yellow;mso-highlight:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 call_get_fu=
nc_ip:1, /* Do we call get_func_ip() */<o:p></o:p></span></strong></pre><pr=
e><strong><span style=3D'font-family:"Courier New";background:yellow;mso-hi=
ghlight:yellow'>-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tstamp_type_access:1; /* Accesse=
d __sk_buff-&gt;tstamp_type */<o:p></o:p></span></strong></pre><pre><strong=
><span style=3D'font-family:"Courier New";background:yellow;mso-highlight:y=
ellow'>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tstamp_type_access:1, /* Accessed __sk_bu=
ff-&gt;tstamp_type */<o:p></o:p></span></strong></pre><pre><strong><span st=
yle=3D'font-family:"Courier New";background:yellow;mso-highlight:yellow'>+=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 valid_id:1; /* Is bpf_prog::aux::__id valid? */<o:=
p></o:p></span></strong></pre><pre><strong><span style=3D'font-family:"Cour=
ier New";background:yellow;mso-highlight:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 enum bpf_prog_type=C2=A0=C2=A0=C2=A0=C2=A0 type;=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Type of BPF program */<o:p></=
o:p></span></strong></pre><pre><strong><span style=3D'font-family:"Courier =
New";background:yellow;mso-highlight:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 enum bpf_attach_type=C2=A0=C2=A0 expected_attach_type; /* For som=
e prog types */<o:p></o:p></span></strong></pre><pre><strong><span style=3D=
'font-family:"Courier New";background:yellow;mso-highlight:yellow'> =C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u32=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 len;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Number=
 of filter blocks */<o:p></o:p></span></strong></pre><pre><strong><span sty=
le=3D'font-family:"Courier New";background:yellow;mso-highlight:yellow'>@@ =
-1688,6 +1689,12 @@ void bpf_prog_inc(struct bpf_prog *prog);<o:p></o:p></s=
pan></strong></pre><pre><strong><span style=3D'font-family:"Courier New";ba=
ckground:yellow;mso-highlight:yellow'> struct bpf_prog * __must_check bpf_p=
rog_inc_not_zero(struct bpf_prog *prog);<o:p></o:p></span></strong></pre><p=
re><strong><span style=3D'font-family:"Courier New";background:yellow;mso-h=
ighlight:yellow'> void bpf_prog_put(struct bpf_prog *prog);<o:p></o:p></spa=
n></strong></pre><pre><strong><span style=3D'font-family:"Courier New";back=
ground:yellow;mso-highlight:yellow'> <o:p></o:p></span></strong></pre><pre>=
<strong><span style=3D'font-family:"Courier New";background:yellow;mso-high=
light:yellow'>+static inline u32 bpf_prog_get_id(const struct bpf_prog *pro=
g)<o:p></o:p></span></strong></pre><pre><strong><span style=3D'font-family:=
"Courier New";background:yellow;mso-highlight:yellow'>+{<o:p></o:p></span><=
/strong></pre><pre><strong><span style=3D'font-family:"Courier New";backgro=
und:yellow;mso-highlight:yellow'>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (=
WARN(!prog-&gt;valid_id, &quot;Attempting to use an invalid eBPF program&qu=
ot;))<o:p></o:p></span></strong></pre><pre><strong><span style=3D'font-fami=
ly:"Courier New";background:yellow;mso-highlight:yellow'>+=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;<o=
:p></o:p></span></strong></pre><pre><strong><span style=3D'font-family:"Cou=
rier New";background:yellow;mso-highlight:yellow'>+=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 return prog-&gt;aux-&gt;__id;<o:p></o:p></span></strong></pre>=
<pre><strong><span style=3D'font-family:"Courier New";background:yellow;mso=
-highlight:yellow'>+}<o:p></o:p></span></strong></pre><pre><strong><span st=
yle=3D'font-family:"Courier New";background:yellow;mso-highlight:yellow'> v=
oid bpf_prog_free_id(struct bpf_prog *prog, bool do_idr_lock);<o:p></o:p></=
span></strong></pre><pre><strong><span style=3D'font-family:"Courier New";b=
ackground:yellow;mso-highlight:yellow'> void bpf_map_free_id(struct bpf_map=
 *map, bool do_idr_lock);<o:p></o:p></span></strong></pre><pre><strong><spa=
n style=3D'font-family:"Courier New";background:yellow;mso-highlight:yellow=
'> <o:p></o:p></span></strong></pre><pre><strong><span style=3D'font-family=
:"Courier New";background:yellow;mso-highlight:yellow'>diff --git a/include=
/linux/bpf_verifier.h b/include/linux/bpf_verifier.h<o:p></o:p></span></str=
ong></pre><pre><strong><span style=3D'font-family:"Courier New";background:=
yellow;mso-highlight:yellow'>index 9e1e6965f407..525c02cc12ea 100644<o:p></=
o:p></span></strong></pre><pre><strong><span style=3D'font-family:"Courier =
New";background:yellow;mso-highlight:yellow'>--- a/include/linux/bpf_verifi=
er.h<o:p></o:p></span></strong></pre><pre><strong><span style=3D'font-famil=
y:"Courier New";background:yellow;mso-highlight:yellow'>+++ b/include/linux=
/bpf_verifier.h<o:p></o:p></span></strong></pre><pre><strong><span style=3D=
'font-family:"Courier New";background:yellow;mso-highlight:yellow'>@@ -604,=
7 +604,7 @@ static inline u64 bpf_trampoline_compute_key(const struct bpf_p=
rog *tgt_prog,<o:p></o:p></span></strong></pre><pre><strong><span style=3D'=
font-family:"Courier New";background:yellow;mso-highlight:yellow'> =C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0struct btf *btf, u32 btf_id)<o:p></o:p></span></strong></=
pre><pre><strong><span style=3D'font-family:"Courier New";background:yellow=
;mso-highlight:yellow'> {<o:p></o:p></span></strong></pre><pre><strong><spa=
n style=3D'font-family:"Courier New";background:yellow;mso-highlight:yellow=
'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (tgt_prog)<o:p></o:p></span></st=
rong></pre><pre><strong><span style=3D'font-family:"Courier New";background=
:yellow;mso-highlight:yellow'>-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ((u64)tgt_prog-&gt;aux-&gt;id &=
lt;&lt; 32) | btf_id;<o:p></o:p></span></strong></pre><pre><strong><span st=
yle=3D'font-family:"Courier New";background:yellow;mso-highlight:yellow'>+=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 return ((u64)bpf_prog_get_id(tgt_prog) &lt;&lt; 32) | btf_id;<o:p></o:p=
></span></strong></pre><pre><strong><span style=3D'font-family:"Courier New=
";background:yellow;mso-highlight:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 else<o:p></o:p></span></strong></pre><pre><strong><span style=3D'fon=
t-family:"Courier New";background:yellow;mso-highlight:yellow'> =C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 retur=
n ((u64)btf_obj_id(btf) &lt;&lt; 32) | 0x80000000 | btf_id;<o:p></o:p></spa=
n></strong></pre><pre><strong><span style=3D'font-family:"Courier New";back=
ground:yellow;mso-highlight:yellow'> }<o:p></o:p></span></strong></pre><pre=
><strong><span style=3D'font-family:"Courier New";background:yellow;mso-hig=
hlight:yellow'>diff --git a/include/trace/events/xdp.h b/include/trace/even=
ts/xdp.h<o:p></o:p></span></strong></pre><pre><strong><span style=3D'font-f=
amily:"Courier New";background:yellow;mso-highlight:yellow'>index c40fc97f9=
417..a1c3048872ea 100644<o:p></o:p></span></strong></pre><pre><strong><span=
 style=3D'font-family:"Courier New";background:yellow;mso-highlight:yellow'=
>--- a/include/trace/events/xdp.h<o:p></o:p></span></strong></pre><pre><str=
ong><span style=3D'font-family:"Courier New";background:yellow;mso-highligh=
t:yellow'>+++ b/include/trace/events/xdp.h<o:p></o:p></span></strong></pre>=
<pre><strong><span style=3D'font-family:"Courier New";background:yellow;mso=
-highlight:yellow'>@@ -39,7 +39,7 @@ TRACE_EVENT(xdp_exception,<o:p></o:p><=
/span></strong></pre><pre><strong><span style=3D'font-family:"Courier New";=
background:yellow;mso-highlight:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 ),<o:p></o:p></span></strong></pre><pre><strong><span style=3D'font-fam=
ily:"Courier New";background:yellow;mso-highlight:yellow'> <o:p></o:p></spa=
n></strong></pre><pre><strong><span style=3D'font-family:"Courier New";back=
ground:yellow;mso-highlight:yellow'>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 TP_fast_assign(<o:p></o:p></span></strong></pre><pre><strong><span styl=
e=3D'font-family:"Courier New";background:yellow;mso-highlight:yellow'>-=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 __entry-&gt;prog_id=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D xdp-&gt;aux-&g=
t;id;<o:p></o:p></span></strong></pre><pre><strong><span style=3D'font-fami=
ly:"Courier New";background:yellow;mso-highlight:yellow'>+=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry-&gt=
;prog_id=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D (xdp-&gt;valid_id ? xdp-&g=
t;aux-&gt;__id : 0);<o:p></o:p></span></strong></pre><pre><strong><span sty=
le=3D'font-family:"Courier New";background:yellow;mso-highlight:yellow'> =
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 __entry-&gt;act=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 =3D act;<o:p></o:p></span></strong></pre><pre><strong><span style=3D=
'font-family:"Courier New";background:yellow;mso-highlight:yellow'> =C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __=
entry-&gt;ifindex=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D dev-&gt;ifindex;<=
o:p></o:p></span></strong></pre><pre><strong><span style=3D'font-family:"Co=
urier New";background:yellow;mso-highlight:yellow'> =C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 ),<o:p></o:p></span></strong></pre><pre><strong><span style=
=3D'font-family:"Courier New";background:yellow;mso-highlight:yellow'>@@ -1=
20,7 +120,7 @@ DECLARE_EVENT_CLASS(xdp_redirect_template,<o:p></o:p></span>=
</strong></pre><pre><strong><span style=3D'font-family:"Courier New";backgr=
ound:yellow;mso-highlight:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 map_index =3D 0;<o:p></o:p></span></strong></pre><pre><strong>=
<span style=3D'font-family:"Courier New";background:yellow;mso-highlight:ye=
llow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 }<o:p></o:p></span></strong></pre><pre><strong><span style=3D'=
font-family:"Courier New";background:yellow;mso-highlight:yellow'> <o:p></o=
:p></span></strong></pre><pre><strong><span style=3D'font-family:"Courier N=
ew";background:yellow;mso-highlight:yellow'>-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry-&gt;prog_id=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D xdp-&gt;aux-&gt;id;<o:p></o:p></span></s=
trong></pre><pre><strong><span style=3D'font-family:"Courier New";backgroun=
d:yellow;mso-highlight:yellow'>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry-&gt;prog_id=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 =3D (xdp-&gt;valid_id ? xdp-&gt;aux-&gt;__id : 0);<o:p><=
/o:p></span></strong></pre><pre><strong><span style=3D'font-family:"Courier=
 New";background:yellow;mso-highlight:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry-&gt;act=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D XDP_REDIRECT;<o:=
p></o:p></span></strong></pre><pre><strong><span style=3D'font-family:"Cour=
ier New";background:yellow;mso-highlight:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry-&gt;ifindex=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D dev-&gt;ifindex;<o:p></o:p></span>=
</strong></pre><pre><strong><span style=3D'font-family:"Courier New";backgr=
ound:yellow;mso-highlight:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry-&gt;err=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D err;<o:p></o:p></span></stro=
ng></pre><pre><strong><span style=3D'font-family:"Courier New";background:y=
ellow;mso-highlight:yellow'>diff --git a/kernel/bpf/arraymap.c b/kernel/bpf=
/arraymap.c<o:p></o:p></span></strong></pre><pre><strong><span style=3D'fon=
t-family:"Courier New";background:yellow;mso-highlight:yellow'>index 832b26=
59e96e..d19db5980b1b 100644<o:p></o:p></span></strong></pre><pre><strong><s=
pan style=3D'font-family:"Courier New";background:yellow;mso-highlight:yell=
ow'>--- a/kernel/bpf/arraymap.c<o:p></o:p></span></strong></pre><pre><stron=
g><span style=3D'font-family:"Courier New";background:yellow;mso-highlight:=
yellow'>+++ b/kernel/bpf/arraymap.c<o:p></o:p></span></strong></pre><pre><s=
trong><span style=3D'font-family:"Courier New";background:yellow;mso-highli=
ght:yellow'>@@ -905,7 +905,7 @@ static void prog_fd_array_put_ptr(void *ptr=
)<o:p></o:p></span></strong></pre><pre><strong><span style=3D'font-family:"=
Courier New";background:yellow;mso-highlight:yellow'> <o:p></o:p></span></s=
trong></pre><pre><strong><span style=3D'font-family:"Courier New";backgroun=
d:yellow;mso-highlight:yellow'>=C2=A0static u32 prog_fd_array_sys_lookup_el=
em(void *ptr)<o:p></o:p></span></strong></pre><pre><strong><span style=3D'f=
ont-family:"Courier New";background:yellow;mso-highlight:yellow'> {<o:p></o=
:p></span></strong></pre><pre><strong><span style=3D'font-family:"Courier N=
ew";background:yellow;mso-highlight:yellow'>-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 return ((struct bpf_prog *)ptr)-&gt;aux-&gt;id;<o:p></o:p></span></s=
trong></pre><pre><strong><span style=3D'font-family:"Courier New";backgroun=
d:yellow;mso-highlight:yellow'>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return=
 bpf_prog_get_id((struct bpf_prog *)ptr);<o:p></o:p></span></strong></pre><=
pre><strong><span style=3D'font-family:"Courier New";background:yellow;mso-=
highlight:yellow'> }<o:p></o:p></span></strong></pre><pre><strong><span sty=
le=3D'font-family:"Courier New";background:yellow;mso-highlight:yellow'> <o=
:p></o:p></span></strong></pre><pre><strong><span style=3D'font-family:"Cou=
rier New";background:yellow;mso-highlight:yellow'>=C2=A0/* decrement refcnt=
 of all bpf_progs that are stored in this map */<o:p></o:p></span></strong>=
</pre><pre><strong><span style=3D'font-family:"Courier New";background:yell=
ow;mso-highlight:yellow'>diff --git a/kernel/bpf/bpf_struct_ops.c b/kernel/=
bpf/bpf_struct_ops.c<o:p></o:p></span></strong></pre><pre><strong><span sty=
le=3D'font-family:"Courier New";background:yellow;mso-highlight:yellow'>ind=
ex 84b2d9dba79a..6c20e6cd9442 100644<o:p></o:p></span></strong></pre><pre><=
strong><span style=3D'font-family:"Courier New";background:yellow;mso-highl=
ight:yellow'>--- a/kernel/bpf/bpf_struct_ops.c<o:p></o:p></span></strong></=
pre><pre><strong><span style=3D'font-family:"Courier New";background:yellow=
;mso-highlight:yellow'>+++ b/kernel/bpf/bpf_struct_ops.c<o:p></o:p></span><=
/strong></pre><pre><strong><span style=3D'font-family:"Courier New";backgro=
und:yellow;mso-highlight:yellow'>@@ -488,7 +488,7 @@ static int bpf_struct_=
ops_map_update_elem(struct bpf_map *map, void *key,<o:p></o:p></span></stro=
ng></pre><pre><strong><span style=3D'font-family:"Courier New";background:y=
ellow;mso-highlight:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 image +=3D err;<o:p></o:p></span></strong=
></pre><pre><strong><span style=3D'font-family:"Courier New";background:yel=
low;mso-highlight:yellow'> <o:p></o:p></span></strong></pre><pre><strong><s=
pan style=3D'font-family:"Courier New";background:yellow;mso-highlight:yell=
ow'>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 /* put prog_id to udata */<o:p></o:p></span></strong></pre>=
<pre><strong><span style=3D'font-family:"Courier New";background:yellow;mso=
-highlight:yellow'>-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 *(unsigned long *)(udata + moff) =3D prog-&gt;aux-=
&gt;id;<o:p></o:p></span></strong></pre><pre><strong><span style=3D'font-fa=
mily:"Courier New";background:yellow;mso-highlight:yellow'>+=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *(unsigned =
long *)(udata + moff) =3D bpf_prog_get_id(prog);<o:p></o:p></span></strong>=
</pre><pre><strong><span style=3D'font-family:"Courier New";background:yell=
ow;mso-highlight:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }<o:p></o:p>=
</span></strong></pre><pre><strong><span style=3D'font-family:"Courier New"=
;background:yellow;mso-highlight:yellow'> <o:p></o:p></span></strong></pre>=
<pre><strong><span style=3D'font-family:"Courier New";background:yellow;mso=
-highlight:yellow'>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 refcount_set(=
&amp;kvalue-&gt;refcnt, 1);<o:p></o:p></span></strong></pre><pre><strong><s=
pan style=3D'font-family:"Courier New";background:yellow;mso-highlight:yell=
ow'>diff --git a/kernel/bpf/cgroup.c b/kernel/bpf/cgroup.c<o:p></o:p></span=
></strong></pre><pre><strong><span style=3D'font-family:"Courier New";backg=
round:yellow;mso-highlight:yellow'>index bf2fdb33fb31..4a8d26f1d5d1 100644<=
o:p></o:p></span></strong></pre><pre><strong><span style=3D'font-family:"Co=
urier New";background:yellow;mso-highlight:yellow'>--- a/kernel/bpf/cgroup.=
c<o:p></o:p></span></strong></pre><pre><strong><span style=3D'font-family:"=
Courier New";background:yellow;mso-highlight:yellow'>+++ b/kernel/bpf/cgrou=
p.c<o:p></o:p></span></strong></pre><pre><strong><span style=3D'font-family=
:"Courier New";background:yellow;mso-highlight:yellow'>@@ -1091,7 +1091,7 @=
@ static int __cgroup_bpf_query(struct cgroup *cgrp, const union bpf_attr *=
attr,<o:p></o:p></span></strong></pre><pre><strong><span style=3D'font-fami=
ly:"Courier New";background:yellow;mso-highlight:yellow'> =C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 i =3D 0;<o:p></o:p></span></strong></p=
re><pre><strong><span style=3D'font-family:"Courier New";background:yellow;=
mso-highlight:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 hlist_for_each_entry(pl, progs, node) {<o:p></o:p></span></strong></pre><p=
re><strong><span style=3D'font-family:"Courier New";background:yellow;mso-h=
ighlight:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 prog =3D prog_list_prog(pl);<o:p=
></o:p></span></strong></pre><pre><strong><span style=3D'font-family:"Couri=
er New";background:yellow;mso-highlight:yellow'>-=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 id =3D prog-&gt;aux-&gt;id;<o:p></o:p></span></strong></pre><pre><strong><=
span style=3D'font-family:"Courier New";background:yellow;mso-highlight:yel=
low'>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 id =3D bpf_prog_get_id(prog);<o:p></o:p></sp=
an></strong></pre><pre><strong><span style=3D'font-family:"Courier New";bac=
kground:yellow;mso-highlight:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (copy_to=
_user(prog_ids + i, &amp;id, sizeof(id)))<o:p></o:p></span></strong></pre><=
pre><strong><span style=3D'font-family:"Courier New";background:yellow;mso-=
highlight:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 return -EFAULT;<o:p></o:p></span></strong></pre><pre><strong><=
span style=3D'font-family:"Courier New";background:yellow;mso-highlight:yel=
low'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (++i =3D=3D cnt)<o:p></o:p></span></stron=
g></pre><pre><strong><span style=3D'font-family:"Courier New";background:ye=
llow;mso-highlight:yellow'>diff --git a/kernel/bpf/core.c b/kernel/bpf/core=
.c<o:p></o:p></span></strong></pre><pre><strong><span style=3D'font-family:=
"Courier New";background:yellow;mso-highlight:yellow'>index 25a54e04560e..e=
a3938ab6f5b 100644<o:p></o:p></span></strong></pre><pre><strong><span style=
=3D'font-family:"Courier New";background:yellow;mso-highlight:yellow'>--- a=
/kernel/bpf/core.c<o:p></o:p></span></strong></pre><pre><strong><span style=
=3D'font-family:"Courier New";background:yellow;mso-highlight:yellow'>+++ b=
/kernel/bpf/core.c<o:p></o:p></span></strong></pre><pre><strong><span style=
=3D'font-family:"Courier New";background:yellow;mso-highlight:yellow'>@@ -2=
293,7 +2293,7 @@ static bool bpf_prog_array_copy_core(struct bpf_prog_array=
 *array,<o:p></o:p></span></strong></pre><pre><strong><span style=3D'font-f=
amily:"Courier New";background:yellow;mso-highlight:yellow'> =C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 for (item =3D array-&gt;items; item-&gt;prog; item=
++) {<o:p></o:p></span></strong></pre><pre><strong><span style=3D'font-fami=
ly:"Courier New";background:yellow;mso-highlight:yellow'> =C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (item-&g=
t;prog =3D=3D &amp;dummy_bpf_prog.prog)<o:p></o:p></span></strong></pre><pr=
e><strong><span style=3D'font-family:"Courier New";background:yellow;mso-hi=
ghlight:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 conti=
nue;<o:p></o:p></span></strong></pre><pre><strong><span style=3D'font-famil=
y:"Courier New";background:yellow;mso-highlight:yellow'>-=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 prog_ids[i] =
=3D item-&gt;prog-&gt;aux-&gt;id;<o:p></o:p></span></strong></pre><pre><str=
ong><span style=3D'font-family:"Courier New";background:yellow;mso-highligh=
t:yellow'>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 prog_ids[i] =3D bpf_prog_get_id(item-&gt;prog);<o:p></o:p><=
/span></strong></pre><pre><strong><span style=3D'font-family:"Courier New";=
background:yellow;mso-highlight:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (++i =3D=3D request_cnt) {=
<o:p></o:p></span></strong></pre><pre><strong><span style=3D'font-family:"C=
ourier New";background:yellow;mso-highlight:yellow'> =C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 item++;<o:p></o:p></span></strong></pre><pre=
><strong><span style=3D'font-family:"Courier New";background:yellow;mso-hig=
hlight:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break=
;<o:p></o:p></span></strong></pre><pre><strong><span style=3D'font-family:"=
Courier New";background:yellow;mso-highlight:yellow'>diff --git a/kernel/bp=
f/cpumap.c b/kernel/bpf/cpumap.c<o:p></o:p></span></strong></pre><pre><stro=
ng><span style=3D'font-family:"Courier New";background:yellow;mso-highlight=
:yellow'>index b5ba34ddd4b6..3f3423d03aea 100644<o:p></o:p></span></strong>=
</pre><pre><strong><span style=3D'font-family:"Courier New";background:yell=
ow;mso-highlight:yellow'>--- a/kernel/bpf/cpumap.c<o:p></o:p></span></stron=
g></pre><pre><strong><span style=3D'font-family:"Courier New";background:ye=
llow;mso-highlight:yellow'>+++ b/kernel/bpf/cpumap.c<o:p></o:p></span></str=
ong></pre><pre><strong><span style=3D'font-family:"Courier New";background:=
yellow;mso-highlight:yellow'>@@ -413,7 +413,7 @@ static int __cpu_map_load_=
bpf_program(struct bpf_cpu_map_entry *rcpu,<o:p></o:p></span></strong></pre=
><pre><strong><span style=3D'font-family:"Courier New";background:yellow;ms=
o-highlight:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 return -EINVAL;<o:p></o:p></span></strong></pre><p=
re><strong><span style=3D'font-family:"Courier New";background:yellow;mso-h=
ighlight:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }<o:p></o:p></span><=
/strong></pre><pre><strong><span style=3D'font-family:"Courier New";backgro=
und:yellow;mso-highlight:yellow'> <o:p></o:p></span></strong></pre><pre><st=
rong><span style=3D'font-family:"Courier New";background:yellow;mso-highlig=
ht:yellow'>-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rcpu-&gt;value.bpf_prog.id=
 =3D prog-&gt;aux-&gt;id;<o:p></o:p></span></strong></pre><pre><strong><spa=
n style=3D'font-family:"Courier New";background:yellow;mso-highlight:yellow=
'>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rcpu-&gt;value.bpf_prog.id =3D bpf_=
prog_get_id(prog);<o:p></o:p></span></strong></pre><pre><strong><span style=
=3D'font-family:"Courier New";background:yellow;mso-highlight:yellow'> =C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rcpu-&gt;prog =3D prog;<o:p></o:p></span>=
</strong></pre><pre><strong><span style=3D'font-family:"Courier New";backgr=
ound:yellow;mso-highlight:yellow'> <o:p></o:p></span></strong></pre><pre><s=
trong><span style=3D'font-family:"Courier New";background:yellow;mso-highli=
ght:yellow'>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;<o:p></o:p>=
</span></strong></pre><pre><strong><span style=3D'font-family:"Courier New"=
;background:yellow;mso-highlight:yellow'>diff --git a/kernel/bpf/devmap.c b=
/kernel/bpf/devmap.c<o:p></o:p></span></strong></pre><pre><strong><span sty=
le=3D'font-family:"Courier New";background:yellow;mso-highlight:yellow'>ind=
ex f9a87dcc5535..d46309d4aa9e 100644<o:p></o:p></span></strong></pre><pre><=
strong><span style=3D'font-family:"Courier New";background:yellow;mso-highl=
ight:yellow'>--- a/kernel/bpf/devmap.c<o:p></o:p></span></strong></pre><pre=
><strong><span style=3D'font-family:"Courier New";background:yellow;mso-hig=
hlight:yellow'>+++ b/kernel/bpf/devmap.c<o:p></o:p></span></strong></pre><p=
re><strong><span style=3D'font-family:"Courier New";background:yellow;mso-h=
ighlight:yellow'>@@ -868,7 +868,7 @@ static struct bpf_dtab_netdev *__dev_m=
ap_alloc_node(struct net *net,<o:p></o:p></span></strong></pre><pre><strong=
><span style=3D'font-family:"Courier New";background:yellow;mso-highlight:y=
ellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev-&gt;dtab =3D dtab;<o:p></o=
:p></span></strong></pre><pre><strong><span style=3D'font-family:"Courier N=
ew";background:yellow;mso-highlight:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 if (prog) {<o:p></o:p></span></strong></pre><pre><strong><span style=
=3D'font-family:"Courier New";background:yellow;mso-highlight:yellow'> =C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 dev-&gt;xdp_prog =3D prog;<o:p></o:p></span></strong></pre><pre><strong><s=
pan style=3D'font-family:"Courier New";background:yellow;mso-highlight:yell=
ow'>-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 dev-&gt;val.bpf_prog.id =3D prog-&gt;aux-&gt;id;<o:p></o:p></span=
></strong></pre><pre><strong><span style=3D'font-family:"Courier New";backg=
round:yellow;mso-highlight:yellow'>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev-&gt;val.bpf_prog.id =3D bpf_pro=
g_get_id(prog);<o:p></o:p></span></strong></pre><pre><strong><span style=3D=
'font-family:"Courier New";background:yellow;mso-highlight:yellow'> =C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } else {<o:p></o:p></span></strong></pre><pr=
e><strong><span style=3D'font-family:"Courier New";background:yellow;mso-hi=
ghlight:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 dev-&gt;xdp_prog =3D NULL;<o:p></o:p></span></strong>=
</pre><pre><strong><span style=3D'font-family:"Courier New";background:yell=
ow;mso-highlight:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev-&gt;val.bpf_prog.id =3D 0;<o:p></o:p></s=
pan></strong></pre><pre><strong><span style=3D'font-family:"Courier New";ba=
ckground:yellow;mso-highlight:yellow'>diff --git a/kernel/bpf/syscall.c b/k=
ernel/bpf/syscall.c<o:p></o:p></span></strong></pre><pre><strong><span styl=
e=3D'font-family:"Courier New";background:yellow;mso-highlight:yellow'>inde=
x 7b373a5e861f..9e862ef792cb 100644<o:p></o:p></span></strong></pre><pre><s=
trong><span style=3D'font-family:"Courier New";background:yellow;mso-highli=
ght:yellow'>--- a/kernel/bpf/syscall.c<o:p></o:p></span></strong></pre><pre=
><strong><span style=3D'font-family:"Courier New";background:yellow;mso-hig=
hlight:yellow'>+++ b/kernel/bpf/syscall.c<o:p></o:p></span></strong></pre><=
pre><strong><span style=3D'font-family:"Courier New";background:yellow;mso-=
highlight:yellow'>@@ -1958,13 +1958,14 @@ static void bpf_audit_prog(const =
struct bpf_prog *prog, unsigned int op)<o:p></o:p></span></strong></pre><pr=
e><strong><span style=3D'font-family:"Courier New";background:yellow;mso-hi=
ghlight:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 return;<o:p></o:p></span></strong></pre><pre><strong>=
<span style=3D'font-family:"Courier New";background:yellow;mso-highlight:ye=
llow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (audit_enabled =3D=3D AUDIT_=
OFF)<o:p></o:p></span></strong></pre><pre><strong><span style=3D'font-famil=
y:"Courier New";background:yellow;mso-highlight:yellow'> =C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;<o:p></=
o:p></span></strong></pre><pre><strong><span style=3D'font-family:"Courier =
New";background:yellow;mso-highlight:yellow'>-=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 if (op =3D=3D BPF_AUDIT_LOAD)<o:p></o:p></span></strong></pre><pr=
e><strong><span style=3D'font-family:"Courier New";background:yellow;mso-hi=
ghlight:yellow'>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!in_irq() &amp;&a=
mp; !irqs_disabled())<o:p></o:p></span></strong></pre><pre><strong><span st=
yle=3D'font-family:"Courier New";background:yellow;mso-highlight:yellow'> =
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 ctx =3D audit_context();<o:p></o:p></span></strong></pre><pre><strong><=
span style=3D'font-family:"Courier New";background:yellow;mso-highlight:yel=
low'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ab =3D audit_log_start(ctx, GFP_=
ATOMIC, AUDIT_BPF);<o:p></o:p></span></strong></pre><pre><strong><span styl=
e=3D'font-family:"Courier New";background:yellow;mso-highlight:yellow'> =C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (unlikely(!ab))<o:p></o:p></span></str=
ong></pre><pre><strong><span style=3D'font-family:"Courier New";background:=
yellow;mso-highlight:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;<o:p></o:p></span></strong></pre><=
pre><strong><span style=3D'font-family:"Courier New";background:yellow;mso-=
highlight:yellow'>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* log the id regar=
dless of bpf_prog::valid_id */<o:p></o:p></span></strong></pre><pre><strong=
><span style=3D'font-family:"Courier New";background:yellow;mso-highlight:y=
ellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 audit_log_format(ab, &quot;pro=
g-id=3D%u op=3D%s&quot;,<o:p></o:p></span></strong></pre><pre><strong><span=
 style=3D'font-family:"Courier New";background:yellow;mso-highlight:yellow'=
>-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0  prog-&gt;aux-&gt;id=
, bpf_audit_str[op]);<o:p></o:p></span></strong></pre><pre><strong><span st=
yle=3D'font-family:"Courier New";background:yellow;mso-highlight:yellow'>+=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0  prog-&gt;aux-&gt;__id,=
 bpf_audit_str[op]);<o:p></o:p></span></strong></pre><pre><strong><span sty=
le=3D'font-family:"Courier New";background:yellow;mso-highlight:yellow'> =
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 audit_log_end(ab);<o:p></o:p></span></=
strong></pre><pre><strong><span style=3D'font-family:"Courier New";backgrou=
nd:yellow;mso-highlight:yellow'> }<o:p></o:p></span></strong></pre><pre><st=
rong><span style=3D'font-family:"Courier New";background:yellow;mso-highlig=
ht:yellow'> <o:p></o:p></span></strong></pre><pre><strong><span style=3D'fo=
nt-family:"Courier New";background:yellow;mso-highlight:yellow'>@@ -1975,8 =
+1976,10 @@ static int bpf_prog_alloc_id(struct bpf_prog *prog)<o:p></o:p><=
/span></strong></pre><pre><strong><span style=3D'font-family:"Courier New";=
background:yellow;mso-highlight:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 idr_preload(GFP_KERNEL);<o:p></o:p></span></strong></pre><pre><strong><=
span style=3D'font-family:"Courier New";background:yellow;mso-highlight:yel=
low'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 spin_lock_bh(&amp;prog_idr_lock)=
;<o:p></o:p></span></strong></pre><pre><strong><span style=3D'font-family:"=
Courier New";background:yellow;mso-highlight:yellow'> =C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 id =3D idr_alloc_cyclic(&amp;prog_idr, prog, 1, INT_MAX, GF=
P_ATOMIC);<o:p></o:p></span></strong></pre><pre><strong><span style=3D'font=
-family:"Courier New";background:yellow;mso-highlight:yellow'>-=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 if (id &gt; 0)<o:p></o:p></span></strong></pre><pr=
e><strong><span style=3D'font-family:"Courier New";background:yellow;mso-hi=
ghlight:yellow'>-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 prog-&gt;aux-&gt;id =3D id;<o:p></o:p></span></strong=
></pre><pre><strong><span style=3D'font-family:"Courier New";background:yel=
low;mso-highlight:yellow'>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (id &gt;=
 0) {<o:p></o:p></span></strong></pre><pre><strong><span style=3D'font-fami=
ly:"Courier New";background:yellow;mso-highlight:yellow'>+=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 prog-&gt;au=
x-&gt;__id =3D id;<o:p></o:p></span></strong></pre><pre><strong><span style=
=3D'font-family:"Courier New";background:yellow;mso-highlight:yellow'>+=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 prog-&gt;valid_id =3D true;<o:p></o:p></span></strong></pre><pre><strong><=
span style=3D'font-family:"Courier New";background:yellow;mso-highlight:yel=
low'>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }<o:p></o:p></span></strong></pr=
e><pre><strong><span style=3D'font-family:"Courier New";background:yellow;m=
so-highlight:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 spin_unlock_bh(&=
amp;prog_idr_lock);<o:p></o:p></span></strong></pre><pre><strong><span styl=
e=3D'font-family:"Courier New";background:yellow;mso-highlight:yellow'> =C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 idr_preload_end();<o:p></o:p></span></str=
ong></pre><pre><strong><span style=3D'font-family:"Courier New";background:=
yellow;mso-highlight:yellow'> <o:p></o:p></span></strong></pre><pre><strong=
><span style=3D'font-family:"Courier New";background:yellow;mso-highlight:y=
ellow'>@@ -1996,7 +1999,7 @@ void bpf_prog_free_id(struct bpf_prog *prog, b=
ool do_idr_lock)<o:p></o:p></span></strong></pre><pre><strong><span style=
=3D'font-family:"Courier New";background:yellow;mso-highlight:yellow'> =C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0* disappears - even if someone grab=
s an fd to them they are unusable,<o:p></o:p></span></strong></pre><pre><st=
rong><span style=3D'font-family:"Courier New";background:yellow;mso-highlig=
ht:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0* simply waiting for=
 refcnt to drop to be freed.<o:p></o:p></span></strong></pre><pre><strong><=
span style=3D'font-family:"Courier New";background:yellow;mso-highlight:yel=
low'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0*/<o:p></o:p></span></stro=
ng></pre><pre><strong><span style=3D'font-family:"Courier New";background:y=
ellow;mso-highlight:yellow'>-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!prog=
-&gt;aux-&gt;id)<o:p></o:p></span></strong></pre><pre><strong><span style=
=3D'font-family:"Courier New";background:yellow;mso-highlight:yellow'>+=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!prog-&gt;valid_id)<o:p></o:p></span>=
</strong></pre><pre><strong><span style=3D'font-family:"Courier New";backgr=
ound:yellow;mso-highlight:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;<o:p></o:p></span></strong><=
/pre><pre><strong><span style=3D'font-family:"Courier New";background:yello=
w;mso-highlight:yellow'> <o:p></o:p></span></strong></pre><pre><strong><spa=
n style=3D'font-family:"Courier New";background:yellow;mso-highlight:yellow=
'>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (do_idr_lock)<o:p></o:p></s=
pan></strong></pre><pre><strong><span style=3D'font-family:"Courier New";ba=
ckground:yellow;mso-highlight:yellow'>@@ -2004,8 +2007,8 @@ void bpf_prog_f=
ree_id(struct bpf_prog *prog, bool do_idr_lock)<o:p></o:p></span></strong><=
/pre><pre><strong><span style=3D'font-family:"Courier New";background:yello=
w;mso-highlight:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else<o:p></o:=
p></span></strong></pre><pre><strong><span style=3D'font-family:"Courier Ne=
w";background:yellow;mso-highlight:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __acquire(&amp;prog_idr_lo=
ck);<o:p></o:p></span></strong></pre><pre><strong><span style=3D'font-famil=
y:"Courier New";background:yellow;mso-highlight:yellow'> <o:p></o:p></span>=
</strong></pre><pre><strong><span style=3D'font-family:"Courier New";backgr=
ound:yellow;mso-highlight:yellow'>-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 idr=
_remove(&amp;prog_idr, prog-&gt;aux-&gt;id);<o:p></o:p></span></strong></pr=
e><pre><strong><span style=3D'font-family:"Courier New";background:yellow;m=
so-highlight:yellow'>-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 prog-&gt;aux-&gt=
;id =3D 0;<o:p></o:p></span></strong></pre><pre><strong><span style=3D'font=
-family:"Courier New";background:yellow;mso-highlight:yellow'>+=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 idr_remove(&amp;prog_idr, prog-&gt;aux-&gt;__id);<=
o:p></o:p></span></strong></pre><pre><strong><span style=3D'font-family:"Co=
urier New";background:yellow;mso-highlight:yellow'>+=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 prog-&gt;valid_id =3D false;<o:p></o:p></span></strong></pr=
e><pre><strong><span style=3D'font-family:"Courier New";background:yellow;m=
so-highlight:yellow'> <o:p></o:p></span></strong></pre><pre><strong><span s=
tyle=3D'font-family:"Courier New";background:yellow;mso-highlight:yellow'>=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (do_idr_lock)<o:p></o:p></spa=
n></strong></pre><pre><strong><span style=3D'font-family:"Courier New";back=
ground:yellow;mso-highlight:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 spin_unlock_irqrestore(&amp;prog=
_idr_lock, flags);<o:p></o:p></span></strong></pre><pre><strong><span style=
=3D'font-family:"Courier New";background:yellow;mso-highlight:yellow'>@@ -2=
154,7 +2157,7 @@ static void bpf_prog_show_fdinfo(struct seq_file *m, struc=
t file *filp)<o:p></o:p></span></strong></pre><pre><strong><span style=3D'f=
ont-family:"Courier New";background:yellow;mso-highlight:yellow'> =C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=
=A0=C2=A0=C2=A0prog-&gt;jited,<o:p></o:p></span></strong></pre><pre><strong=
><span style=3D'font-family:"Courier New";background:yellow;mso-highlight:y=
ellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0prog_tag,<o:p></o:p></span></strong></pre><p=
re><strong><span style=3D'font-family:"Courier New";background:yellow;mso-h=
ighlight:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0prog-&gt;pages * 1ULL &lt;&lt; PAGE=
_SHIFT,<o:p></o:p></span></strong></pre><pre><strong><span style=3D'font-fa=
mily:"Courier New";background:yellow;mso-highlight:yellow'>-=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=
=A0 prog-&gt;aux-&gt;id,<o:p></o:p></span></strong></pre><pre><strong><span=
 style=3D'font-family:"Courier New";background:yellow;mso-highlight:yellow'=
>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 =C2=A0=C2=A0 bpf_prog_get_id(prog),<o:p></o:p></span></strong></pre>=
<pre><strong><span style=3D'font-family:"Courier New";background:yellow;mso=
-highlight:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0stats.nsecs,<o:p></o:p></span></=
strong></pre><pre><strong><span style=3D'font-family:"Courier New";backgrou=
nd:yellow;mso-highlight:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0stats.cnt,<o:p></o:p=
></span></strong></pre><pre><strong><span style=3D'font-family:"Courier New=
";background:yellow;mso-highlight:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0stats.mi=
sses,<o:p></o:p></span></strong></pre><pre><strong><span style=3D'font-fami=
ly:"Courier New";background:yellow;mso-highlight:yellow'>@@ -2786,7 +2789,7=
 @@ static void bpf_link_show_fdinfo(struct seq_file *m, struct file *filp)=
<o:p></o:p></span></strong></pre><pre><strong><span style=3D'font-family:"C=
ourier New";background:yellow;mso-highlight:yellow'> =C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0bpf_link_type_strs[link-&gt;type],<o:p></o:p></span></strong></pre><pre>=
<strong><span style=3D'font-family:"Courier New";background:yellow;mso-high=
light:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0link-&gt;id,<o:p></o:p></span></strong=
></pre><pre><strong><span style=3D'font-family:"Courier New";background:yel=
low;mso-highlight:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0prog_tag,<o:p></o:p></span=
></strong></pre><pre><strong><span style=3D'font-family:"Courier New";backg=
round:yellow;mso-highlight:yellow'>-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0 prog-&gt;aux-&gt;id);<=
o:p></o:p></span></strong></pre><pre><strong><span style=3D'font-family:"Co=
urier New";background:yellow;mso-highlight:yellow'>+=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0 bpf_=
prog_get_id(prog));<o:p></o:p></span></strong></pre><pre><strong><span styl=
e=3D'font-family:"Courier New";background:yellow;mso-highlight:yellow'> =C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (link-&gt;ops-&gt;show_fdinfo)<o:p></o=
:p></span></strong></pre><pre><strong><span style=3D'font-family:"Courier N=
ew";background:yellow;mso-highlight:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 link-&gt;ops-&gt;show_fdin=
fo(link, m);<o:p></o:p></span></strong></pre><pre><strong><span style=3D'fo=
nt-family:"Courier New";background:yellow;mso-highlight:yellow'> }<o:p></o:=
p></span></strong></pre><pre><strong><span style=3D'font-family:"Courier Ne=
w";background:yellow;mso-highlight:yellow'>@@ -3914,7 +3917,7 @@ static int=
 bpf_prog_get_info_by_fd(struct file *file,<o:p></o:p></span></strong></pre=
><pre><strong><span style=3D'font-family:"Courier New";background:yellow;ms=
o-highlight:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 return -EFAULT;<o:p></o:p></span></strong></pre><p=
re><strong><span style=3D'font-family:"Courier New";background:yellow;mso-h=
ighlight:yellow'> <o:p></o:p></span></strong></pre><pre><strong><span style=
=3D'font-family:"Courier New";background:yellow;mso-highlight:yellow'>=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 info.type =3D prog-&gt;type;<o:p></=
o:p></span></strong></pre><pre><strong><span style=3D'font-family:"Courier =
New";background:yellow;mso-highlight:yellow'>-=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 info.id =3D prog-&gt;aux-&gt;id;<o:p></o:p></span></strong></pre>=
<pre><strong><span style=3D'font-family:"Courier New";background:yellow;mso=
-highlight:yellow'>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 info.id =3D bpf_pr=
og_get_id(prog);<o:p></o:p></span></strong></pre><pre><strong><span style=
=3D'font-family:"Courier New";background:yellow;mso-highlight:yellow'> =C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 info.load_time =3D prog-&gt;aux-&gt;load_=
time;<o:p></o:p></span></strong></pre><pre><strong><span style=3D'font-fami=
ly:"Courier New";background:yellow;mso-highlight:yellow'> =C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 info.created_by_uid =3D from_kuid_munged(current_user=
_ns(),<o:p></o:p></span></strong></pre><pre><strong><span style=3D'font-fam=
ily:"Courier New";background:yellow;mso-highlight:yellow'> =C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0prog-&gt;aux-&gt;user-&gt;uid);<o:p></o:p></span></str=
ong></pre><pre><strong><span style=3D'font-family:"Courier New";background:=
yellow;mso-highlight:yellow'>@@ -4261,7 +4264,7 @@ static int bpf_link_get_=
info_by_fd(struct file *file,<o:p></o:p></span></strong></pre><pre><strong>=
<span style=3D'font-family:"Courier New";background:yellow;mso-highlight:ye=
llow'> <o:p></o:p></span></strong></pre><pre><strong><span style=3D'font-fa=
mily:"Courier New";background:yellow;mso-highlight:yellow'>=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 info.type =3D link-&gt;type;<o:p></o:p></span><=
/strong></pre><pre><strong><span style=3D'font-family:"Courier New";backgro=
und:yellow;mso-highlight:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 info=
.id =3D link-&gt;id;<o:p></o:p></span></strong></pre><pre><strong><span sty=
le=3D'font-family:"Courier New";background:yellow;mso-highlight:yellow'>-=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 info.prog_id =3D link-&gt;prog-&gt;aux=
-&gt;id;<o:p></o:p></span></strong></pre><pre><strong><span style=3D'font-f=
amily:"Courier New";background:yellow;mso-highlight:yellow'>+=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 info.prog_id =3D bpf_prog_get_id(link-&gt;prog);<o=
:p></o:p></span></strong></pre><pre><strong><span style=3D'font-family:"Cou=
rier New";background:yellow;mso-highlight:yellow'> <o:p></o:p></span></stro=
ng></pre><pre><strong><span style=3D'font-family:"Courier New";background:y=
ellow;mso-highlight:yellow'>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (=
link-&gt;ops-&gt;fill_link_info) {<o:p></o:p></span></strong></pre><pre><st=
rong><span style=3D'font-family:"Courier New";background:yellow;mso-highlig=
ht:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 err =3D link-&gt;ops-&gt;fill_link_info(link, &amp;info);<o=
:p></o:p></span></strong></pre><pre><strong><span style=3D'font-family:"Cou=
rier New";background:yellow;mso-highlight:yellow'>@@ -4426,7 +4429,7 @@ sta=
tic int bpf_task_fd_query(const union bpf_attr *attr,<o:p></o:p></span></st=
rong></pre><pre><strong><span style=3D'font-family:"Courier New";background=
:yellow;mso-highlight:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 struct bpf_raw_event_map *btp =3D raw_tp-&gt;btp;<o:p></o:p></spa=
n></strong></pre><pre><strong><span style=3D'font-family:"Courier New";back=
ground:yellow;mso-highlight:yellow'> <o:p></o:p></span></strong></pre><pre>=
<strong><span style=3D'font-family:"Courier New";background:yellow;mso-high=
light:yellow'>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 er=
r =3D bpf_task_fd_query_copy(attr, uattr,<o:p></o:p></span></strong></pre><=
pre><strong><span style=3D'font-family:"Courier New";background:yellow;mso-=
highlight:yellow'>-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=
=C2=A0=C2=A0 raw_tp-&gt;link.prog-&gt;aux-&gt;id,<o:p></o:p></span></strong=
></pre><pre><strong><span style=3D'font-family:"Courier New";background:yel=
low;mso-highlight:yellow'>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=
=C2=A0=C2=A0=C2=A0 bpf_prog_get_id(raw_tp-&gt;link.prog),<o:p></o:p></span>=
</strong></pre><pre><strong><span style=3D'font-family:"Courier New";backgr=
ound:yellow;mso-highlight:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0BPF_FD_TYPE_RAW_TRACEPOINT,<o:p></o:p></span=
></strong></pre><pre><strong><span style=3D'font-family:"Courier New";backg=
round:yellow;mso-highlight:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0btp-&gt;tp-&gt;name, 0, 0);<o:p></o:p></span=
></strong></pre><pre><strong><span style=3D'font-family:"Courier New";backg=
round:yellow;mso-highlight:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 goto put_file;<o:p></o:p></span></strong></pre><pre><strong><s=
pan style=3D'font-family:"Courier New";background:yellow;mso-highlight:yell=
ow'>diff --git a/kernel/events/core.c b/kernel/events/core.c<o:p></o:p></sp=
an></strong></pre><pre><strong><span style=3D'font-family:"Courier New";bac=
kground:yellow;mso-highlight:yellow'>index aefc1e08e015..c24e897d27f1 10064=
4<o:p></o:p></span></strong></pre><pre><strong><span style=3D'font-family:"=
Courier New";background:yellow;mso-highlight:yellow'>--- a/kernel/events/co=
re.c<o:p></o:p></span></strong></pre><pre><strong><span style=3D'font-famil=
y:"Courier New";background:yellow;mso-highlight:yellow'>+++ b/kernel/events=
/core.c<o:p></o:p></span></strong></pre><pre><strong><span style=3D'font-fa=
mily:"Courier New";background:yellow;mso-highlight:yellow'>@@ -9001,7 +9001=
,11 @@ void perf_event_bpf_event(struct bpf_prog *prog,<o:p></o:p></span></=
strong></pre><pre><strong><span style=3D'font-family:"Courier New";backgrou=
nd:yellow;mso-highlight:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 },<o:p></o:p></span></strong></pre><pre><strong><span style=3D'fo=
nt-family:"Courier New";background:yellow;mso-highlight:yellow'> =C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .type =3D type,<o:p></o:p></span=
></strong></pre><pre><strong><span style=3D'font-family:"Courier New";backg=
round:yellow;mso-highlight:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 .flags =3D flags,<o:p></o:p></span></strong></pre><pre><strong=
><span style=3D'font-family:"Courier New";background:yellow;mso-highlight:y=
ellow'>-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .id =3D prog-&=
gt;aux-&gt;id,<o:p></o:p></span></strong></pre><pre><strong><span style=3D'=
font-family:"Courier New";background:yellow;mso-highlight:yellow'>+=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*<o:p></o:p></span></strong>=
</pre><pre><strong><span style=3D'font-family:"Courier New";background:yell=
ow;mso-highlight:yellow'>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0  * don't use bpf_prog_get_id() as the id may be marked<o:p></o:p></span=
></strong></pre><pre><strong><span style=3D'font-family:"Courier New";backg=
round:yellow;mso-highlight:yellow'>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0  * invalid on PERF_BPF_EVENT_PROG_UNLOAD events<o:p></o:p></sp=
an></strong></pre><pre><strong><span style=3D'font-family:"Courier New";bac=
kground:yellow;mso-highlight:yellow'>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0  */<o:p></o:p></span></strong></pre><pre><strong><span styl=
e=3D'font-family:"Courier New";background:yellow;mso-highlight:yellow'>+=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .id =3D prog-&gt;aux-&gt;_=
_id,<o:p></o:p></span></strong></pre><pre><strong><span style=3D'font-famil=
y:"Courier New";background:yellow;mso-highlight:yellow'> =C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },<o:p></o:p><=
/span></strong></pre><pre><strong><span style=3D'font-family:"Courier New";=
background:yellow;mso-highlight:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 };<o:p></o:p></span></strong></pre><pre><strong><span style=3D'font-fam=
ily:"Courier New";background:yellow;mso-highlight:yellow'> <o:p></o:p></spa=
n></strong></pre><pre><strong><span style=3D'font-family:"Courier New";back=
ground:yellow;mso-highlight:yellow'>diff --git a/kernel/trace/bpf_trace.c b=
/kernel/trace/bpf_trace.c<o:p></o:p></span></strong></pre><pre><strong><spa=
n style=3D'font-family:"Courier New";background:yellow;mso-highlight:yellow=
'>index 49fb9ec8366d..7cd0eb83b137 100644<o:p></o:p></span></strong></pre><=
pre><strong><span style=3D'font-family:"Courier New";background:yellow;mso-=
highlight:yellow'>--- a/kernel/trace/bpf_trace.c<o:p></o:p></span></strong>=
</pre><pre><strong><span style=3D'font-family:"Courier New";background:yell=
ow;mso-highlight:yellow'>+++ b/kernel/trace/bpf_trace.c<o:p></o:p></span></=
strong></pre><pre><strong><span style=3D'font-family:"Courier New";backgrou=
nd:yellow;mso-highlight:yellow'>@@ -2344,7 +2344,7 @@ int bpf_get_perf_even=
t_info(const struct perf_event *event, u32 *prog_id,<o:p></o:p></span></str=
ong></pre><pre><strong><span style=3D'font-family:"Courier New";background:=
yellow;mso-highlight:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (prog=
-&gt;type =3D=3D BPF_PROG_TYPE_PERF_EVENT)<o:p></o:p></span></strong></pre>=
<pre><strong><span style=3D'font-family:"Courier New";background:yellow;mso=
-highlight:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 return -EOPNOTSUPP;<o:p></o:p></span></strong></pr=
e><pre><strong><span style=3D'font-family:"Courier New";background:yellow;m=
so-highlight:yellow'> <o:p></o:p></span></strong></pre><pre><strong><span s=
tyle=3D'font-family:"Courier New";background:yellow;mso-highlight:yellow'>-=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *prog_id =3D prog-&gt;aux-&gt;id;<o:p>=
</o:p></span></strong></pre><pre><strong><span style=3D'font-family:"Courie=
r New";background:yellow;mso-highlight:yellow'>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 *prog_id =3D bpf_prog_get_id(prog);<o:p></o:p></span></strong></p=
re><pre><strong><span style=3D'font-family:"Courier New";background:yellow;=
mso-highlight:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 flags =3D event=
-&gt;tp_event-&gt;flags;<o:p></o:p></span></strong></pre><pre><strong><span=
 style=3D'font-family:"Courier New";background:yellow;mso-highlight:yellow'=
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 is_tracepoint =3D flags &amp; TRACE_=
EVENT_FL_TRACEPOINT;<o:p></o:p></span></strong></pre><pre><strong><span sty=
le=3D'font-family:"Courier New";background:yellow;mso-highlight:yellow'> =
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 is_syscall_tp =3D is_syscall_trace_eve=
nt(event-&gt;tp_event);<o:p></o:p></span></strong></pre><pre><strong><span =
style=3D'font-family:"Courier New";background:yellow;mso-highlight:yellow'>=
diff --git a/net/core/dev.c b/net/core/dev.c<o:p></o:p></span></strong></pr=
e><pre><strong><span style=3D'font-family:"Courier New";background:yellow;m=
so-highlight:yellow'>index fa53830d0683..0d39ef22cf4b 100644<o:p></o:p></sp=
an></strong></pre><pre><strong><span style=3D'font-family:"Courier New";bac=
kground:yellow;mso-highlight:yellow'>--- a/net/core/dev.c<o:p></o:p></span>=
</strong></pre><pre><strong><span style=3D'font-family:"Courier New";backgr=
ound:yellow;mso-highlight:yellow'>+++ b/net/core/dev.c<o:p></o:p></span></s=
trong></pre><pre><strong><span style=3D'font-family:"Courier New";backgroun=
d:yellow;mso-highlight:yellow'>@@ -9068,7 +9068,7 @@ u32 dev_xdp_prog_id(st=
ruct net_device *dev, enum bpf_xdp_mode mode)<o:p></o:p></span></strong></p=
re><pre><strong><span style=3D'font-family:"Courier New";background:yellow;=
mso-highlight:yellow'> {<o:p></o:p></span></strong></pre><pre><strong><span=
 style=3D'font-family:"Courier New";background:yellow;mso-highlight:yellow'=
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct bpf_prog *prog =3D dev_xdp_pr=
og(dev, mode);<o:p></o:p></span></strong></pre><pre><strong><span style=3D'=
font-family:"Courier New";background:yellow;mso-highlight:yellow'> <o:p></o=
:p></span></strong></pre><pre><strong><span style=3D'font-family:"Courier N=
ew";background:yellow;mso-highlight:yellow'>-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 return prog ? prog-&gt;aux-&gt;id : 0;<o:p></o:p></span></strong></p=
re><pre><strong><span style=3D'font-family:"Courier New";background:yellow;=
mso-highlight:yellow'>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return prog ? b=
pf_prog_get_id(prog) : 0;<o:p></o:p></span></strong></pre><pre><strong><spa=
n style=3D'font-family:"Courier New";background:yellow;mso-highlight:yellow=
'> }<o:p></o:p></span></strong></pre><pre><strong><span style=3D'font-famil=
y:"Courier New";background:yellow;mso-highlight:yellow'> <o:p></o:p></span>=
</strong></pre><pre><strong><span style=3D'font-family:"Courier New";backgr=
ound:yellow;mso-highlight:yellow'>=C2=A0static void dev_xdp_set_link(struct=
 net_device *dev, enum bpf_xdp_mode mode,<o:p></o:p></span></strong></pre><=
pre><strong><span style=3D'font-family:"Courier New";background:yellow;mso-=
highlight:yellow'>diff --git a/net/core/filter.c b/net/core/filter.c<o:p></=
o:p></span></strong></pre><pre><strong><span style=3D'font-family:"Courier =
New";background:yellow;mso-highlight:yellow'>index bb0136e7a8e4..282ccfe34c=
ed 100644<o:p></o:p></span></strong></pre><pre><strong><span style=3D'font-=
family:"Courier New";background:yellow;mso-highlight:yellow'>--- a/net/core=
/filter.c<o:p></o:p></span></strong></pre><pre><strong><span style=3D'font-=
family:"Courier New";background:yellow;mso-highlight:yellow'>+++ b/net/core=
/filter.c<o:p></o:p></span></strong></pre><pre><strong><span style=3D'font-=
family:"Courier New";background:yellow;mso-highlight:yellow'>@@ -8729,7 +87=
29,8 @@ void bpf_warn_invalid_xdp_action(struct net_device *dev, struct bpf=
_prog *prog,<o:p></o:p></span></strong></pre><pre><strong><span style=3D'fo=
nt-family:"Courier New";background:yellow;mso-highlight:yellow'> <o:p></o:p=
></span></strong></pre><pre><strong><span style=3D'font-family:"Courier New=
";background:yellow;mso-highlight:yellow'>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 pr_warn_once(&quot;%s XDP return value %u on prog %s (id %d) dev =
%s, expect packet loss!\n&quot;,<o:p></o:p></span></strong></pre><pre><stro=
ng><span style=3D'font-family:"Courier New";background:yellow;mso-highlight=
:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0act &gt; act_max ? &quot;Ille=
gal&quot; : &quot;Driver unsupported&quot;,<o:p></o:p></span></strong></pre=
><pre><strong><span style=3D'font-family:"Courier New";background:yellow;ms=
o-highlight:yellow'>-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 act, prog-&gt;aux-&gt;nam=
e, prog-&gt;aux-&gt;id, dev ? dev-&gt;name : &quot;N/A&quot;);<o:p></o:p></=
span></strong></pre><pre><strong><span style=3D'font-family:"Courier New";b=
ackground:yellow;mso-highlight:yellow'>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 act,=
 prog-&gt;aux-&gt;name, bpf_prog_get_id(prog),<o:p></o:p></span></strong></=
pre><pre><strong><span style=3D'font-family:"Courier New";background:yellow=
;mso-highlight:yellow'>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 dev ? dev-&gt;name : &=
quot;N/A&quot;);<o:p></o:p></span></strong></pre><pre><strong><span style=
=3D'font-family:"Courier New";background:yellow;mso-highlight:yellow'> }<o:=
p></o:p></span></strong></pre><pre><strong><span style=3D'font-family:"Cour=
ier New";background:yellow;mso-highlight:yellow'> EXPORT_SYMBOL_GPL(bpf_war=
n_invalid_xdp_action);<o:p></o:p></span></strong></pre><pre><strong><span s=
tyle=3D'font-family:"Courier New";background:yellow;mso-highlight:yellow'> =
<o:p></o:p></span></strong></pre><pre><strong><span style=3D'font-family:"C=
ourier New";background:yellow;mso-highlight:yellow'>diff --git a/net/core/r=
tnetlink.c b/net/core/rtnetlink.c<o:p></o:p></span></strong></pre><pre><str=
ong><span style=3D'font-family:"Courier New";background:yellow;mso-highligh=
t:yellow'>index 74864dc46a7e..1f7e36909541 100644<o:p></o:p></span></strong=
></pre><pre><strong><span style=3D'font-family:"Courier New";background:yel=
low;mso-highlight:yellow'>--- a/net/core/rtnetlink.c<o:p></o:p></span></str=
ong></pre><pre><strong><span style=3D'font-family:"Courier New";background:=
yellow;mso-highlight:yellow'>+++ b/net/core/rtnetlink.c<o:p></o:p></span></=
strong></pre><pre><strong><span style=3D'font-family:"Courier New";backgrou=
nd:yellow;mso-highlight:yellow'>@@ -1453,7 +1453,7 @@ static u32 rtnl_xdp_p=
rog_skb(struct net_device *dev)<o:p></o:p></span></strong></pre><pre><stron=
g><span style=3D'font-family:"Courier New";background:yellow;mso-highlight:=
yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 generic_xdp_prog =3D rtnl_der=
eference(dev-&gt;xdp_prog);<o:p></o:p></span></strong></pre><pre><strong><s=
pan style=3D'font-family:"Courier New";background:yellow;mso-highlight:yell=
ow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!generic_xdp_prog)<o:p></o:p>=
</span></strong></pre><pre><strong><span style=3D'font-family:"Courier New"=
;background:yellow;mso-highlight:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;<o:p></o:p></span></=
strong></pre><pre><strong><span style=3D'font-family:"Courier New";backgrou=
nd:yellow;mso-highlight:yellow'>-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 retur=
n generic_xdp_prog-&gt;aux-&gt;id;<o:p></o:p></span></strong></pre><pre><st=
rong><span style=3D'font-family:"Courier New";background:yellow;mso-highlig=
ht:yellow'>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return bpf_prog_get_id(gen=
eric_xdp_prog);<o:p></o:p></span></strong></pre><pre><strong><span style=3D=
'font-family:"Courier New";background:yellow;mso-highlight:yellow'> }<o:p><=
/o:p></span></strong></pre><pre><strong><span style=3D'font-family:"Courier=
 New";background:yellow;mso-highlight:yellow'> <o:p></o:p></span></strong><=
/pre><pre><strong><span style=3D'font-family:"Courier New";background:yello=
w;mso-highlight:yellow'>=C2=A0static u32 rtnl_xdp_prog_drv(struct net_devic=
e *dev)<o:p></o:p></span></strong></pre><pre><strong><span style=3D'font-fa=
mily:"Courier New";background:yellow;mso-highlight:yellow'>diff --git a/net=
/core/sock_map.c b/net/core/sock_map.c<o:p></o:p></span></strong></pre><pre=
><strong><span style=3D'font-family:"Courier New";background:yellow;mso-hig=
hlight:yellow'>index a660baedd9e7..550ec6cb3aee 100644<o:p></o:p></span></s=
trong></pre><pre><strong><span style=3D'font-family:"Courier New";backgroun=
d:yellow;mso-highlight:yellow'>--- a/net/core/sock_map.c<o:p></o:p></span><=
/strong></pre><pre><strong><span style=3D'font-family:"Courier New";backgro=
und:yellow;mso-highlight:yellow'>+++ b/net/core/sock_map.c<o:p></o:p></span=
></strong></pre><pre><strong><span style=3D'font-family:"Courier New";backg=
round:yellow;mso-highlight:yellow'>@@ -1518,7 +1518,7 @@ int sock_map_bpf_p=
rog_query(const union bpf_attr *attr,<o:p></o:p></span></strong></pre><pre>=
<strong><span style=3D'font-family:"Courier New";background:yellow;mso-high=
light:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* we do not hold the r=
efcnt, the bpf prog may be released<o:p></o:p></span></strong></pre><pre><s=
trong><span style=3D'font-family:"Courier New";background:yellow;mso-highli=
ght:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0* asynchronously an=
d the id would be set to 0.<o:p></o:p></span></strong></pre><pre><strong><s=
pan style=3D'font-family:"Courier New";background:yellow;mso-highlight:yell=
ow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0*/<o:p></o:p></span></stron=
g></pre><pre><strong><span style=3D'font-family:"Courier New";background:ye=
llow;mso-highlight:yellow'>-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 id =3D dat=
a_race(prog-&gt;aux-&gt;id);<o:p></o:p></span></strong></pre><pre><strong><=
span style=3D'font-family:"Courier New";background:yellow;mso-highlight:yel=
low'>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 id =3D data_race(bpf_prog_get_id=
(prog));<o:p></o:p></span></strong></pre><pre><strong><span style=3D'font-f=
amily:"Courier New";background:yellow;mso-highlight:yellow'> =C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 if (id =3D=3D 0)<o:p></o:p></span></strong></pre><=
pre><strong><span style=3D'font-family:"Courier New";background:yellow;mso-=
highlight:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 prog_cnt =3D 0;<o:p></o:p></span></strong></pre><p=
re><strong><span style=3D'font-family:"Courier New";background:yellow;mso-h=
ighlight:yellow'> <o:p></o:p></span></strong></pre><pre><strong><span style=
=3D'font-family:"Courier New";background:yellow;mso-highlight:yellow'>diff =
--git a/net/ipv6/seg6_local.c b/net/ipv6/seg6_local.c<o:p></o:p></span></st=
rong></pre><pre><strong><span style=3D'font-family:"Courier New";background=
:yellow;mso-highlight:yellow'>index 8370726ae7bf..440ce3aba802 100644<o:p><=
/o:p></span></strong></pre><pre><strong><span style=3D'font-family:"Courier=
 New";background:yellow;mso-highlight:yellow'>--- a/net/ipv6/seg6_local.c<o=
:p></o:p></span></strong></pre><pre><strong><span style=3D'font-family:"Cou=
rier New";background:yellow;mso-highlight:yellow'>+++ b/net/ipv6/seg6_local=
.c<o:p></o:p></span></strong></pre><pre><strong><span style=3D'font-family:=
"Courier New";background:yellow;mso-highlight:yellow'>@@ -1543,7 +1543,8 @@=
 static int put_nla_bpf(struct sk_buff *skb, struct seg6_local_lwt *slwt)<o=
:p></o:p></span></strong></pre><pre><strong><span style=3D'font-family:"Cou=
rier New";background:yellow;mso-highlight:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 if (!nest)<o:p></o:p></span></strong></pre><pre><strong><span =
style=3D'font-family:"Courier New";background:yellow;mso-highlight:yellow'>=
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 return -EMSGSIZE;<o:p></o:p></span></strong></pre><pre><strong><span=
 style=3D'font-family:"Courier New";background:yellow;mso-highlight:yellow'=
> <o:p></o:p></span></strong></pre><pre><strong><span style=3D'font-family:=
"Courier New";background:yellow;mso-highlight:yellow'>-=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 if (nla_put_u32(skb, SEG6_LOCAL_BPF_PROG, slwt-&gt;bpf.p=
rog-&gt;aux-&gt;id))<o:p></o:p></span></strong></pre><pre><strong><span sty=
le=3D'font-family:"Courier New";background:yellow;mso-highlight:yellow'>+=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (nla_put_u32(skb, SEG6_LOCAL_BPF_PR=
OG,<o:p></o:p></span></strong></pre><pre><strong><span style=3D'font-family=
:"Courier New";background:yellow;mso-highlight:yellow'>+=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bpf_prog_get_id(slwt-&gt;bpf.prog)))<o:p>=
</o:p></span></strong></pre><pre><strong><span style=3D'font-family:"Courie=
r New";background:yellow;mso-highlight:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EMSGSIZE;<o:p><=
/o:p></span></strong></pre><pre><strong><span style=3D'font-family:"Courier=
 New";background:yellow;mso-highlight:yellow'> <o:p></o:p></span></strong><=
/pre><pre><strong><span style=3D'font-family:"Courier New";background:yello=
w;mso-highlight:yellow'>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (slwt=
-&gt;bpf.name &amp;&amp;<o:p></o:p></span></strong></pre><pre><strong><span=
 style=3D'font-family:"Courier New";background:yellow;mso-highlight:yellow'=
>diff --git a/net/sched/act_bpf.c b/net/sched/act_bpf.c<o:p></o:p></span></=
strong></pre><pre><strong><span style=3D'font-family:"Courier New";backgrou=
nd:yellow;mso-highlight:yellow'>index b79eee44e24e..604a29e482b0 100644<o:p=
></o:p></span></strong></pre><pre><strong><span style=3D'font-family:"Couri=
er New";background:yellow;mso-highlight:yellow'>--- a/net/sched/act_bpf.c<o=
:p></o:p></span></strong></pre><pre><strong><span style=3D'font-family:"Cou=
rier New";background:yellow;mso-highlight:yellow'>+++ b/net/sched/act_bpf.c=
<o:p></o:p></span></strong></pre><pre><strong><span style=3D'font-family:"C=
ourier New";background:yellow;mso-highlight:yellow'>@@ -121,7 +121,7 @@ sta=
tic int tcf_bpf_dump_ebpf_info(const struct tcf_bpf *prog,<o:p></o:p></span=
></strong></pre><pre><strong><span style=3D'font-family:"Courier New";backg=
round:yellow;mso-highlight:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
=C2=A0=C2=A0=C2=A0=C2=A0nla_put_string(skb, TCA_ACT_BPF_NAME, prog-&gt;bpf_=
name))<o:p></o:p></span></strong></pre><pre><strong><span style=3D'font-fam=
ily:"Courier New";background:yellow;mso-highlight:yellow'> =C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EMS=
GSIZE;<o:p></o:p></span></strong></pre><pre><strong><span style=3D'font-fam=
ily:"Courier New";background:yellow;mso-highlight:yellow'> <o:p></o:p></spa=
n></strong></pre><pre><strong><span style=3D'font-family:"Courier New";back=
ground:yellow;mso-highlight:yellow'>-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 i=
f (nla_put_u32(skb, TCA_ACT_BPF_ID, prog-&gt;filter-&gt;aux-&gt;id))<o:p></=
o:p></span></strong></pre><pre><strong><span style=3D'font-family:"Courier =
New";background:yellow;mso-highlight:yellow'>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 if (nla_put_u32(skb, TCA_ACT_BPF_ID, bpf_prog_get_id(prog-&gt;fil=
ter)))<o:p></o:p></span></strong></pre><pre><strong><span style=3D'font-fam=
ily:"Courier New";background:yellow;mso-highlight:yellow'> =C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EMS=
GSIZE;<o:p></o:p></span></strong></pre><pre><strong><span style=3D'font-fam=
ily:"Courier New";background:yellow;mso-highlight:yellow'> <o:p></o:p></spa=
n></strong></pre><pre><strong><span style=3D'font-family:"Courier New";back=
ground:yellow;mso-highlight:yellow'>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 nla =3D nla_reserve(skb, TCA_ACT_BPF_TAG, sizeof(prog-&gt;filter-&gt;ta=
g));<o:p></o:p></span></strong></pre><pre><strong><span style=3D'font-famil=
y:"Courier New";background:yellow;mso-highlight:yellow'>diff --git a/net/sc=
hed/cls_bpf.c b/net/sched/cls_bpf.c<o:p></o:p></span></strong></pre><pre><s=
trong><span style=3D'font-family:"Courier New";background:yellow;mso-highli=
ght:yellow'>index bc317b3eac12..eb5ac6be589e 100644<o:p></o:p></span></stro=
ng></pre><pre><strong><span style=3D'font-family:"Courier New";background:y=
ellow;mso-highlight:yellow'>--- a/net/sched/cls_bpf.c<o:p></o:p></span></st=
rong></pre><pre><strong><span style=3D'font-family:"Courier New";background=
:yellow;mso-highlight:yellow'>+++ b/net/sched/cls_bpf.c<o:p></o:p></span></=
strong></pre><pre><strong><span style=3D'font-family:"Courier New";backgrou=
nd:yellow;mso-highlight:yellow'>@@ -565,7 +565,7 @@ static int cls_bpf_dump=
_ebpf_info(const struct cls_bpf_prog *prog,<o:p></o:p></span></strong></pre=
><pre><strong><span style=3D'font-family:"Courier New";background:yellow;ms=
o-highlight:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0=C2=A0nla_put_string(skb, TCA_BPF_NAME, prog-&gt;bpf_name))<o:p></o:p></=
span></strong></pre><pre><strong><span style=3D'font-family:"Courier New";b=
ackground:yellow;mso-highlight:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EMSGSIZE;<o:p></o:p><=
/span></strong></pre><pre><strong><span style=3D'font-family:"Courier New";=
background:yellow;mso-highlight:yellow'> <o:p></o:p></span></strong></pre><=
pre><strong><span style=3D'font-family:"Courier New";background:yellow;mso-=
highlight:yellow'>-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (nla_put_u32(skb=
, TCA_BPF_ID, prog-&gt;filter-&gt;aux-&gt;id))<o:p></o:p></span></strong></=
pre><pre><strong><span style=3D'font-family:"Courier New";background:yellow=
;mso-highlight:yellow'>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (nla_put_u3=
2(skb, TCA_BPF_ID, bpf_prog_get_id(prog-&gt;filter)))<o:p></o:p></span></st=
rong></pre><pre><strong><span style=3D'font-family:"Courier New";background=
:yellow;mso-highlight:yellow'> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EMSGSIZE;<o:p></o:p></span></s=
trong></pre><pre><strong><span style=3D'font-family:"Courier New";backgroun=
d:yellow;mso-highlight:yellow'> <o:p></o:p></span></strong></pre><pre><stro=
ng><span style=3D'font-family:"Courier New";background:yellow;mso-highlight=
:yellow'>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 nla =3D nla_reserve(skb=
, TCA_BPF_TAG, sizeof(prog-&gt;filter-&gt;tag));<o:p></o:p></span></strong>=
</pre><pre><strong><span style=3D'font-family:"Courier New";background:yell=
ow;mso-highlight:yellow'>-- <o:p></o:p></span></strong></pre><pre><strong><=
span style=3D'font-family:"Courier New";background:yellow;mso-highlight:yel=
low'>2.39.0<o:p></o:p></span></strong></pre><pre><strong><span style=3D'fon=
t-family:"Courier New";background:yellow;mso-highlight:yellow'><o:p>&nbsp;<=
/o:p></span></strong></pre><pre><strong><span style=3D'font-family:"Courier=
 New";background:yellow;mso-highlight:yellow'>--<o:p></o:p></span></strong>=
</pre><pre><strong><span style=3D'font-family:"Courier New";background:yell=
ow;mso-highlight:yellow'>Linux-audit mailing list<o:p></o:p></span></strong=
></pre><pre><strong><span style=3D'font-family:"Courier New";background:yel=
low;mso-highlight:yellow'>Linux-audit@redhat.com<o:p></o:p></span></strong>=
</pre><pre><strong><span style=3D'font-family:"Courier New";background:yell=
ow;mso-highlight:yellow'>https://listman.redhat.com/mailman/listinfo/linux-=
audit<o:p></o:p></span></strong></pre></div><p class=3DMsoNormal><strong><s=
pan style=3D'font-family:"Calibri",sans-serif;background:yellow;mso-highlig=
ht:yellow'><o:p>&nbsp;</o:p></span></strong></p><p class=3DMsoNormal><stron=
g><span style=3D'font-family:"Calibri",sans-serif;background:yellow;mso-hig=
hlight:yellow'><o:p>&nbsp;</o:p></span></strong></p><p class=3DMsoNormal><s=
trong><span style=3D'font-family:"Calibri",sans-serif;background:yellow;mso=
-highlight:yellow'>Sent from <a href=3D"https://go.microsoft.com/fwlink/?Li=
nkId=3D550986"><span style=3D'color:windowtext;text-decoration:none'>Mail</=
span></a> for Windows</span></strong><strong><span style=3D'font-family:"Ca=
libri",sans-serif'><o:p></o:p></span></strong></p><p class=3DMsoNormal><str=
ong><span style=3D'font-family:"Calibri",sans-serif'><o:p>&nbsp;</o:p></spa=
n></strong></p></div></body></html>


--===============7445430453268346090==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

--===============7445430453268346090==--

